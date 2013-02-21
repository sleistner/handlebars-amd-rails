require 'tilt'
require 'execjs'

module Handlebars
  module Amd
    module Rails

      module Source

        def self.path
          @path ||= File.expand_path('../../../../vendor/assets/javascripts/handlebars-for-compile.js', __FILE__)
        end

        def self.contents
          @contents ||= File.read(path)
        end

        def self.context
          @context ||= ExecJS.compile(contents)
        end

      end

      class Template < ::Tilt::Template

        def self.default_mime_type
          'application/javascript'
        end

        def prepare
        end

        def evaluate(scope, locals, &block)
          Source.context.call("Handlebars.compileAmd", data, Handlebars.config.to_camelcase)
        end
      end
    end
  end
end
