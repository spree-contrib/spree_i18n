require 'active_support'
require 'spree/i18n_utils'

namespace :spree_i18n do

  SPREE_MODULES = [ 'api', 'core', 'dash', 'promo' ].freeze

  desc "Update by retrieving the latest Spree locale files"
  task :update_default do
    puts "Fetching latest Spree locale file to #{locales_dir}"
    require "uri"; require "net/https"
    SPREE_MODULES.each do |mod|
      location = "https://raw.github.com/spree/spree/master/#{mod}/config/locales/en.yml"
      response = nil
      begin
        uri = URI.parse(location)
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        puts "Getting from #{uri}"
        request = Net::HTTP::Get.new(uri.request_uri)
        response = http.request(request)
        case response
          when Net::HTTPRedirection
            location = response['location']
          when Net::HTTPNotFound
            response = nil
            break
          when Net::HTTPClientError, Net::HTTPServerError
            response.error!
        end
      end until Net::HTTPSuccess === response

      filename = "#{default_dir}/spree_#{mod}.yml"
      if response.nil?
        puts "Received 404 Not Found for #{uri}\nDeleting local default file #{filename}"
        File.delete(filename) rescue false
      else
        File.open(filename, 'w') { |file| file << response.body }
      end
    end
  end

  desc "Synchronize translation files with latest default files"
  task :sync do
    puts "Starting synchronization..."
    defaults = composite_keys

    langs = Set.new
    langs_w_territory = Set.new
    Dir["#{locales_dir}/*.yml"].each do |filename|
      basename = File.basename(filename, '.yml')
      if basename.include?('-')
        langs_w_territory << basename
      else
        langs << basename
      end
    end

    # Process languages files without territory suffix first
    langs.each do |lang|
      (comments, translations) = Spree::I18nUtils.read_file(locales_dir, lang)
      Spree::I18nUtils.write_translated_file(locales_dir, lang, comments, defaults, translations)
    end

    # Now process language files with territory suffix,
    # filling in defaults from language without territory suffix
    langs_w_territory.each do |lang|
      lang_wo_territory = lang.split('-').first
      if langs.include?(lang_wo_territory)
        (_, lang_defaults) = Spree::I18nUtils.read_file(locales_dir, lang_wo_territory)
      else
        lang_defaults = defaults
      end

      (comments, translations) = Spree::I18nUtils.read_file(locales_dir, lang)
      Spree::I18nUtils.write_translated_file(locales_dir, lang, comments, lang_defaults, translations)
    end
  end

  desc "Create a new translation file based on en"
  task :new  do
    unless locale = env_locale
      print "You must provide a valid LOCALE value, for example:\nrake spree:i18:new LOCALE=pt-PT\n"
      exit
    end

    Spree::I18nUtils.write_translated_file(locales_dir, locale, '---', composite_keys, {})
    print "New locale generated.\n"
    print "Don't forget to also download the rails translation from: http://github.com/svenfuchs/rails-i18n/tree/master/rails/locale\n"
  end

  desc "Show translation status for all supported locales other than en."
  task :stats do
    words = composite_keys
    words.delete_if { |k,v| !v.match(/\w+/) or v.match(/^#/) }

    results = ActiveSupport::OrderedHash.new
    locale = ENV['LOCALE'] || ''
    Dir["#{locales_dir}/*.yml"].each do |filename|
      # next unless filename.match('_spree')
      basename = File.basename(filename, '.yml')

      # next if basename.starts_with?('en')
      (_, other) = Spree::I18nUtils.read_file(locales_dir, basename)
      other.delete_if { |k,v| !words[k] } #Remove if not defined in en.yml
      other.delete_if { |k,v| !v.match(/\w+/) or v.match(/#/) }

      translation_status = 100 * (other.values.size / words.values.size.to_f)
      results[basename] = translation_status
    end
    puts "Translation status:"
    results.sort.each do |basename, translation_status|
      puts "#{basename}\t-    #{sprintf('%.1f', translation_status)}%"
    end
    puts
  end

  # Returns a composite hash of all relevant translation keys from each of the gems
  def composite_keys 
    Hash.new.tap do |hash|
      SPREE_MODULES.each do |mod|
        hash.merge! get_translation_keys("spree_#{mod}")
      end
    end
  end

  def get_translation_keys(gem_name)
    (_, words) = Spree::I18nUtils.read_file(File.join(File.dirname(__FILE__), '..', '..', 'default'), gem_name, 'en')
    words
  end

  def locales_dir
    File.join(File.dirname(__FILE__), '..', '..', 'config', 'locales')
  end

  def default_dir
    File.join(File.dirname(__FILE__), '..', '..', 'default')
  end

  def env_locale
    ENV['LOCALE'].presence
  end
end
