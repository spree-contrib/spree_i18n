module SpreeI18n
  class RansackTranslator
    def initialize(klass, params)
      @klass = klass
      @params = params
    end

    def translated_params
      params = @params.dup
      ctx = Ransack::Context.for_class(@klass)

      params.keys.each do |key|
        stripped_name = key.to_s.dup
        pred = Ransack::Predicate.detect_and_strip_from_string!(stripped_name)

        names = stripped_name.split /_or_/

        translated_names = names.map do |name|
          translated_name(ctx, name)
        end

        translated_key = translated_names.join('_or_')
        translated_key += "_#{pred}" unless pred == ''

        if translated_key != key
          params[translated_key] = params[key]
          params.delete key
        end
      end

      params
    end

    private

    def translated_name(ctx, name)
      attrib = Ransack::Nodes::Attribute.new(ctx)
      ctx.bind(attrib, name)

      return name unless attrib.parent

      klass = ctx.klassify(attrib.parent)
      attrib_name = attrib.attr_name
      prefix = name.chomp(attrib_name)

      if (klass.try(:translated_attribute_names) || []).include? attrib_name.to_sym
        "#{name}_or_#{prefix}translations_#{attrib_name}"
      else
        name
      end
    end

  end
end
