RSpec.describe Spree::Product, type: :model do
  include_context 'behaves as translatable'
end

RSpec.describe Spree::OptionType, type: :model do
  include_context 'behaves as translatable'
end

RSpec.describe Spree::Taxon, type: :model do
  include_context 'behaves as translatable'
end

RSpec.describe Spree::Taxonomy, type: :model do
  include_context 'behaves as translatable'
end

RSpec.describe Spree::Promotion, type: :model do
  include_context 'behaves as translatable'
end

RSpec.describe Spree::Property, type: :model do
  include_context 'behaves as translatable'
end
