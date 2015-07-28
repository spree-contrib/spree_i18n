module SpreeI18n
  class RansackTranslator
    def initialize(klass, params)
      @klass = klass
      @params = params
    end

    def translated_params
      @params.each_with_object({}) do |(key, value), result|
        translated_key = key_with_translations(key)
        result[translated_key] = value
      end
    end

    private

    def key_with_translations(key)
      return key if key.to_s == 's'
      names, pred = split_key key
      translated_names = translate_names(names)
      join_key translated_names, pred
    end

    def split_key(key)
      stripped_name = key.to_s.dup
      pred = Ransack::Predicate.detect_and_strip_from_string!(stripped_name)

      names = stripped_name.split(/_or_/)
      [names, pred]
    end

    def join_key(names, pred)
      key = names.join('_or_')
      key += "_#{pred}" unless pred == ''
      key
    end

    def translate_names(names)
      names.map { |name| translated_name(name) }
    end

    def translated_name(name)
      model, attrib_name = locate_attribute name
      prefix = name.chomp(attrib_name)

      if (model.try(:translated_attribute_names) || []).include? attrib_name.to_sym
        "#{name}_or_#{prefix}translations_#{attrib_name}"
      else
        name
      end
    end

    def locate_attribute(name)
      attrib = bound_attribute(name)
      relation = attrib.parent
      attrib_name = attrib.attr_name
      model = context.klassify(relation) if relation
      [model, attrib_name]
    end

    def bound_attribute(name)
      Ransack::Nodes::Attribute.new(context).tap { |attrib| context.bind(attrib, name) }
    end

    def context
      @context ||= Ransack::Context.for_class(@klass)
    end
  end
end
