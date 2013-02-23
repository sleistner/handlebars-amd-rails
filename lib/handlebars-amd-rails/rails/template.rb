require 'tilt'
require 'execjs'

module Handlebars

  module Unindent
    def unindent(heredoc)
      heredoc.gsub(/^#{heredoc[/\A\s*/]}/, '')
    end
  end

  module Amd
    module Rails

      module Source

        def self.path
          @path ||= File.expand_path("../../../../vendor/assets/javascripts/handlebars.js", __FILE__)
        end

        def self.contents
          @contents ||= File.read(path)
        end

        def self.context
          @context ||= ExecJS.compile(contents)
        end

      end

      class Template < ::Tilt::Template

        include Unindent

        def self.default_mime_type
          'application/javascript'
        end

        def prepare
        end

        def evaluate(scope, locals, &block)
          template = Source.context.call("Handlebars.precompile", data, Handlebars.config.to_camelcase)
          interpolate(template)
        end

        private

        def interpolate(template)
          unindent <<-JS
            define(['handlebars'], function(Handlebars) {
              var templates = Handlebars.templates || (Handlebars.templates = {});
              return templates['#{template_name}'] = Handlebars.template(#{template});
            });
          JS
        end

        def template_name
          @template_name ||= begin
            template_root = Handlebars.config.template_root
            file.split(template_root).last.split('.', 2).first
          end
        end

      end
    end
  end
end
