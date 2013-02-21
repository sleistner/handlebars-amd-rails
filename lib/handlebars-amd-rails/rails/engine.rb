require "rails/engine"
require "template.rb"

module Handlebars
  module Amd
    module Rails
      class Engine < ::Rails::Engine
        initializer :register_dustjs do |app|
          app.assets.register_engine '.hbs', Template
          app.assets.register_engine '.handlebars', Template
        end
      end
    end
  end
end
