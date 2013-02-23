require 'handlebars-amd-rails/version'
require 'handlebars-amd-rails/rails/template'
require 'handlebars-amd-rails/rails/engine'
require 'handlebars-amd-rails/rails/railtie'
require 'ostruct'

module Handlebars

  class Config < OpenStruct

    def to_camelcase
      instance_variable_get(:@table).inject({}) do |memo, (key, value)|
        memo[key.to_s.camelcase(:lower)] = value
        memo
      end
    end

  end

  def self.config
    @@config ||= Config.new
  end

  def self.configure
    yield self.config
  end
end
