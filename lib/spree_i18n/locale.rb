require 'csv'

module SpreeI18n
  class Locale
    class << self
      def all
        Dir["#{dir}/*.yml"].map { |f| File.basename(f, '.yml').to_sym }
      end

      def dir
        File.join(File.dirname(__FILE__), '/../../config/locales')
      end

      def local_language_name(locale)
        @@language_names ||= CSV.read(File.join(__dir__, 'locales_and_local_language_names.csv')).to_h { |row| [row[0], row[2]] }
        @@language_names[locale.to_s.downcase] || @@language_names[locale.to_s.downcase.split('-').first]
      end
    end
  end
end
