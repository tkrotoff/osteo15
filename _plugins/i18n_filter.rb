# Taken from https://github.com/gacha/gacha.id.lv/blob/27bdaa0358030d1776d96e4a44f6639b4051f4f1/_plugins/i18n_filter.rb

require 'i18n'

# FIXME Liquid Exception: Liquid error: "fr" is not a valid locale in ...
I18n.config.available_locales = [:fr]

LOCALE = Jekyll.configuration({})['lang'] # set your locale from config var

# Create folder "_locales" and put some locale file from https://github.com/svenfuchs/rails-i18n/tree/3602742fb8c9b5f213e9be32a030d39f1062b00d/rails/locale
module Jekyll
  module I18nFilter
    # Example:
    #   {{ post.date | localize: "%d.%m.%Y" }}
    #   {{ post.date | localize: ":short" }}
    def localize(input, format=nil)
      load_translations
      format = (format =~ /^:(\w+)/) ? $1.to_sym : format
      I18n.l input, :format => format
    # rescue
    #   "error"
    end

    def load_translations
      if I18n.backend.send(:translations).empty?
        I18n.backend.load_translations Dir[File.join(File.dirname(__FILE__),'../_locales/*.yml')]
        I18n.locale = LOCALE
      end
    end
  end
end

Liquid::Template.register_filter(Jekyll::I18nFilter)
