# encoding: utf-8

require 'yaml'

RSpec.describe 'Locale files' do
  # A word that mixes Latin, Cyrillic and Greek letters is a typo: a lookalike
  # letter (Latin "C" for Cyrillic "С") was typed with the wrong keyboard layout.
  # It looks right, but it breaks search, sorting and screen readers.
  scripts = [/\p{Latin}/, /\p{Cyrillic}/, /\p{Greek}/]

  def strings(node, path, &block)
    case node
    when Hash then node.each { |key, value| strings(value, "#{path}.#{key}", &block) }
    when Array then node.each_with_index { |value, index| strings(value, "#{path}.#{index}", &block) }
    when String then yield path, node
    end
  end

  Dir[File.expand_path('../config/locales/*.yml', __dir__)].sort.each do |file|
    it "#{File.basename(file)} has no words that mix letters from different alphabets" do
      mixed = []
      strings(YAML.load_file(file), File.basename(file, '.yml')) do |path, text|
        words = text.scan(/[\p{L}\p{M}]+/).select { |word| scripts.count { |script| word.match?(script) } > 1 }
        mixed << "#{path}: #{words.join(', ')}" if words.any?
      end
      expect(mixed).to be_empty
    end
  end
end
