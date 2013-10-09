module Spree
  module Core
    ProductFilters.module_eval do
      # Example: filtering by possible brands
      #
      # First, we define the scope. Two interesting points here: (a) we run our conditions
      #   in the scope where the info for the 'brand' property has been loaded; and (b)
      #   because we may want to filter by other properties too, we give this part of the
      #   query a unique name (which must be used in the associated conditions too).
      #
      # Secondly, the filter. Instead of a static list of values, we pull out all existing
      #   brands from the db, and then build conditions which test for string equality on
      #   the (uniquely named) field "p_brand.value". There's also a test for brand info
      #   being blank: note that this relies on with_property doing a left outer join
      #   rather than an inner join.
      if Spree::Property.table_exists?
        Spree::Product.add_search_scope :brand_any do |*opts|
          conds = opts.map {|o| Spree::Core::ProductFilters.brand_filter[:conds][o]}.reject { |c| c.nil? }
          scope = conds.shift
          conds.each do |new_scope|
            scope = scope.or(new_scope)
          end
          Spree::Product.with_property('brand').where(scope)
        end

        def ProductFilters.brand_filter 
          debugger 
          brand_id = Spree::Property::Translation.find_by(name: 'brand')
          brand_id = brand_id.spree_taxon_id if brand_id
          brand_property = brand_id ? Spree::Property.find(brand_id) : nil
          brands = brand_property ? Spree::ProductProperty.where(property_id: brand_property.id).pluck(:value).uniq.map(&:to_s) : []
          pp = Spree::ProductProperty.arel_table
          conds = Hash[*brands.map { |b| [b, pp[:value].eq(b)] }.flatten]
          {
            name:   'Brands',
            scope:  :brand_any,
            conds:  conds,
            labels: (brands.sort).map { |k| [k, k] }
          }
        end
      end
    end
  end
end