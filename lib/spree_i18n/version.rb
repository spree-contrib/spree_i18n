module SpreeI18n
  module_function

  # Returns the version of the currently loaded SpreeI18n as a
  # <tt>Gem::Version</tt>.
  def version
    Gem::Version.new Version::STRING
  end

  module Version
    MAJOR = 5
    MINOR = 2
    TINY  = 0

    STRING = [MAJOR, MINOR, TINY].compact.join('.')
  end
end
