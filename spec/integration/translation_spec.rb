# encoding: utf-8

require 'spec_helper'

describe "Translation" do

  let(:app) do
    SpreeI18n::Spec::FakeApp
  end

  context "when default locale is not set" do
    let(:translation) do
      app.run lambda { I18n.t("activerecord.attributes.spree/address.zipcode") } do |config|
        config.i18n.default_locale = nil
      end
    end

    it "is available" do
      translation.should == "Zip Code"
    end
  end

  # German is chosen as an example of language whose translations are found in a file.
  context "when default locale is German" do
    let(:translation) do
      app.run lambda { I18n.t("activerecord.attributes.spree/address.zipcode") } do |config|
        config.i18n.default_locale = :de
      end
    end

    it "is available" do
      translation.should == "PLZ"
    end
  end

  # Japanese is chosen as an example of language whose translations are splitted into
  # several files in a separated directory.
  context "when default locale is Japanese" do
    let(:translation) do
      app.run lambda { I18n.t("activerecord.attributes.spree/address.zipcode") } do |config|
        config.i18n.default_locale = :ja
      end
    end

    it "is available" do
      translation.should == "郵便番号"
    end
  end
  
  context "when default locale is Japanese, but it is not included in available_locales" do
    let(:translation) do
      app.run lambda { I18n.t("activerecord.attributes.spree/address.zipcode") } do |config|
        config.i18n.available_locales = [ :de, :en, :fr ]
        config.i18n.default_locale = :ja
      end
    end

    it "is not available" do
      translation.should == "translation missing: ja.activerecord.attributes.spree/address.zipcode"
    end
  end
end
