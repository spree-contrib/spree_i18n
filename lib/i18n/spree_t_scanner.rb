require 'i18n/tasks/scanners/pattern_scanner'
module I18n
  module Scanners
    class SpreeTScanner < I18n::Tasks::Scanners::PatternWithScopeScanner
      # Extract i18n keys from file based on the pattern which must capture the key literal.
      # @return [Array<Key>] keys found in file

      # Given
      # @param [MatchData] match
      # @param [String] path
      # @return [String] full absolute key name
      def match_to_key(match, path, location)
        key   = super
        scope = match[1]
        if scope
          scope_ns = scope.gsub(/[\[\]\s]+/, ''.freeze).split(','.freeze).map { |arg| strip_literal(arg) } * '.'.freeze
          new_key = "#{scope_ns}.#{key}"
        else
          new_key = key unless match[0] =~ /\A\w/
        end

        "spree.#{new_key}"
      end

      def translate_call_re
        /Spree.t(?:ranslate)?/
      end
    end
  end
end


