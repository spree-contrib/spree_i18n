require 'spec_helper'

describe "Japanese (ja) translations" do
  describe "spree_api.yml" do
    subject { "config/locales/ja/spree_api.yml" }
    it { subject.should be_a_subset_of("default/spree_api.yml") }
    it { subject.should be_a_complete_translation_of("default/spree_api.yml") }
  end
  
  describe "spree_auth.yml" do
    subject { "config/locales/ja/spree_auth.yml" }
    it { subject.should be_a_subset_of("default/spree_auth.yml") }
    it { subject.should be_a_complete_translation_of("default/spree_auth.yml") }
  end
  
  describe "spree_core.yml" do
    subject { "config/locales/ja/spree_core.yml" }
    it { subject.should be_a_subset_of("default/spree_core.yml") }
    it { subject.should be_a_complete_translation_of("default/spree_core.yml") }
  end
  
  describe "spree_dash.yml" do
    subject { "config/locales/ja/spree_dash.yml" }
    it { subject.should be_a_subset_of("default/spree_dash.yml") }
    it { subject.should be_a_complete_translation_of("default/spree_dash.yml") }
  end
  
  describe "spree_promo.yml" do
    subject { "config/locales/ja/spree_promo.yml" }
    it { subject.should be_a_subset_of("default/spree_promo.yml") }
    it { subject.should be_a_complete_translation_of("default/spree_promo.yml") }
  end
end
