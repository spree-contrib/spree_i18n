Spree::TaxonsController.class_eval do
  def show
    taxon_translation = Spree::Taxon::Translation.find_by(:permalink => params[:id])
    @taxon = Spree::Taxon.find taxon_translation.spree_taxon_id if taxon_translation

    return unless @taxon
    @searcher = build_searcher(params.merge(:taxon => @taxon.id))
    @products = @searcher.retrieve_products
  end
end