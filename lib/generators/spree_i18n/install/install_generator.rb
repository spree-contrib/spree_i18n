module SpreeI18n
  module Generators
    class InstallGenerator < Rails::Generators::Base
      class_option :auto_run_migrations, type: :boolean, default: false
      
      def add_javascripts
        append_file "app/assets/javascripts/admin/all.js", "//= require admin/spree_i18n"
        append_file "app/assets/javascripts/store/all.js", "//= require store/spree_i18n"
      end

      def add_stylesheets
        inject_into_file "app/assets/stylesheets/admin/all.css", " *= require admin/spree_i18n\n",
          :before => /\*\//, :verbose => true
      end

      def add_migrations
        run 'rake railties:install:migrations FROM=spree_i18n'
      end

      def run_migrations
        run_migrations = options[:auto_run_migrations] || ['', 'y', 'Y'].include?(ask 'Would you like to run the migrations now? [Y/n]')
        if run_migrations
          run 'bundle exec rake db:migrate'
        else
          puts 'Skipping rake db:migrate, don\'t forget to run it!'
        end
      end
    end
  end
end
