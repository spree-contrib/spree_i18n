require 'active_support/core_ext'

module Spree
  module I18nUtils

    # Retrieve comments, translation data in hash form
    def read_file(dir, basename, locale=basename)
      filename = File.join(dir, basename + '.yml')
      (comments, data) = IO.read(filename).split(/\n?#{locale}:\s*\n/)   #Add error checking for failed file read?
      return comments, create_hash(data)
    rescue Exception => e
      puts "Failed to read and parse file #{filename}"
      puts e.message
      return '', {}
    end
    module_function :read_file

    # Creates hash of translation data
    def create_hash(data)
      words = Hash.new
      return words if !data
      parent = Array.new
      previous_key = 'base'
      data.split("\n").each do |w|
        next if w.strip.blank? || w.strip.first == '#'
        (key, value) = w.split(':', 2)
        value ||= ''
        value.strip!
        shift = (key =~ /\w/)/2 - parent.size                             #Determine level of current key in comparison to parent array
        key = key.sub(/^\s+/,'')
        parent << previous_key if shift > 0                               #If key is child of previous key, add previous key as parent
        (shift*-1).times { parent.pop } if shift < 0                      #If key is not related to previous key, remove parent keys
        previous_key = key                                                #Track key in case next key is child of this key
        words[parent.join(':')+':'+key] = value
      end
      words
    end
    module_function :create_hash

    # Writes to file from translation data hash structure
    def write_translated_file(dir, basename, comments, base, translation)
      filename = File.join(dir, basename + '.yml')
      File.open(filename, 'w') do |file|
        file.puts("#{comments}\n#{basename}:\n")
        base.sort.each do |k,v|
          keys = k.split(':')
          key = '  ' * (keys.size - 1) + keys[-1] # Add indentation for children keys

          if v.blank?
            # This key just seems to serve as a parent and not as an actual language string
            file.puts "#{key}:\n"
          else
            trans_value = translation[k]
            if trans_value.blank? || trans_value.start_with?('#')
              trans_value = (v.start_with?('#') ? '' : '# ') + v
            end
            file.puts "#{key}: #{trans_value}\n"
          end
        end
      end
    end
    module_function :write_translated_file

  end
end
