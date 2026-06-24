module SpreeI18n
  VERSION = '5.3.2'.freeze

  module_function

  # Returns the version of the currently loaded SpreeI18n as a
  # <tt>Gem::Version</tt>.
  def version
    Gem::Version.new(VERSION)
  end
end
