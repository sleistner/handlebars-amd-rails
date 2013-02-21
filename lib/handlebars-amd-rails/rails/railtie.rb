require 'rails'

module Handlebars
  module Amd
    module Rails
      class Railtie < ::Rails::Railtie

        DEFAULT_TEMPLATE_ROOT = 'app/assets/javascripts/templates/'

        config.handlebars = ActiveSupport::OrderedOptions.new

        initializer "handlebars.configure" do |app|
          Handlebars.configure do |config|
            config.template_root = app.config.handlebars[:template_root] || DEFAULT_TEMPLATE_ROOT
          end
        end
      end
    end
  end
end
