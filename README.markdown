### SUMMARY

This extension is translations pack for Spree Core.


### Usage

**To update translation to your language:**

* `rake spree:i18n:sync`
* edit `config/locales/your_lang_code_spree.yml`

Remember that you can only edit the values of existing keys, you can't add new ones in these files, b/c they will be removed after syncronization.

**To create new translation:**

* `rake spree:i18n:new LOCALE=your_lang_code`
* edit `config/locales/your_lang_code_spree.yml`

**To check current translation status:**

* `rake spree:i18n:sync`
* `rake spree:i18n:stats`

