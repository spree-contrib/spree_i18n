require 'spree/i18n_utils'

namespace :spree_i18n do

  desc "Update by retrieving the latest Spree locale fils"
  task :update_default do
    puts "Fetching latest Spree locale file to #{locales_dir}"
    exec %(
      curl -Lo '#{default_dir}/spree_api.yml' http://github.com/spree/spree/raw/master/api/config/locales/en.yml
      curl -Lo '#{default_dir}/spree_core.yml' http://github.com/spree/spree/raw/master/core/config/locales/en.yml
      curl -Lo '#{default_dir}/spree_promo.yml' http://github.com/spree/spree/raw/master/promo/config/locales/en.yml
      curl -Lo '#{default_dir}/spree_auth.yml' http://github.com/spree/spree/raw/master/auth/config/locales/en.yml
      curl -Lo '#{default_dir}/spree_dash.yml' http://github.com/spree/spree/raw/master/dash/config/locales/en.yml
    )
  end

  desc "Syncronize translation files with latest en (adds comments with fallback en value)"
  task :sync do
    puts "Starting syncronization..."
    words = composite_keys
    Dir["#{locales_dir}/*.yml"].each do |filename|
      basename = File.basename(filename, '.yml')
      (comments, other) = Spree::I18nUtils.read_file(filename, basename)
      words.each { |k,v| other[k] ||= "#{words[k]}" }  #Initializing hash variable as en fallback if it does not exist
      other.delete_if { |k,v| !words[k] } #Remove if not defined in en locale
      Spree::I18nUtils.write_file(filename, basename, comments, other, false)
    end
  end

  desc "Create a new translation file based on en"
  task :new  do
    if !ENV['LOCALE'] || ENV['LOCALE'] == ''
      print "You must provide a valid LOCALE value, for example:\nrake spree:i18:new LOCALE=pt-PT\n"
      exit
    end

    Spree::I18nUtils.write_file "#{locales_dir}/#{ENV['LOCALE']}.yml", "#{ENV['LOCALE']}", '---', composite_keys
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
      (comments, other) = Spree::I18nUtils.read_file(filename, basename)
      other.delete_if { |k,v| !words[k] } #Remove if not defined in en.yml
      other.delete_if { |k,v| !v.match(/\w+/) or v.match(/#/) }

      translation_status = 100*(other.values.size / words.values.size.to_f)
      results[basename] = translation_status
    end
    puts "Translation status:"
    results.sort.each do |basename, translation_status|
      puts basename + "\t-    #{sprintf('%.1f', translation_status)}%"
    end
    puts
  end
  
  # Retrieve US word set
  def get_translation_keys(gem_name)
    Spree::I18nUtils.read_file(File.join(default_dir, "#{gem_name}.yml"), "en").last
  end

  # Returns a composite hash of all relevant translation keys from each of the gems
  def composite_keys 
    api_keys = get_translation_keys "spree_api"
    auth_keys = get_translation_keys "spree_auth"
    core_keys = get_translation_keys "spree_core"
    dash_keys = get_translation_keys "spree_dash"
    promo_keys = get_translation_keys "spree_promo"

    api_keys.merge(auth_keys).merge(core_keys).merge(dash_keys).merge(promo_keys)
  end
  
  def locales_dir
    File.join File.dirname(__FILE__), "/../../config/locales"
  end
  
  def default_dir
    File.join File.dirname(__FILE__), "/../../default"
  end
  
end
