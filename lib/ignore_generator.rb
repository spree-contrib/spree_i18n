require 'zeitwerk'

loader = Zeitwerk::Loader.for_gem
generator_ext = "#{__dir__}/generators/spree_i18n/install"
loader.ignore(generator_ext)