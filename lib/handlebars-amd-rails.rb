require "handlebars-amd-rails/version.rb"
require "handlebars-amd-rails/rails/engine.rb"
require "handlebars-amd-rails/rails/railtie.rb"

module Handlebars

  class Config < OpenStruct

    def to_camelcase
      inject({}) do |memo, (key, value)|
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

