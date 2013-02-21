# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'handlebars-amd-rails/version'

Gem::Specification.new do |gem|
  gem.name          = "handlebars-amd-rails"
  gem.version       = Handlebars::Amd::Rails::VERSION
  gem.authors       = ["Steffen Leistner"]
  gem.email         = ["sleistner@gmail.com"]
  gem.summary       = %q{Use handlebars templates with rails.}
  gem.description   = %q{Use handlebars templates in a amd version with rails.}
  gem.homepage      = "https://github.com/sleistner/handlebars-amd-rails"

  gem.rubyforge_project = "handlebars-amd-rails"

  gem.add_dependency('rails', '> 3.1.0')
  gem.add_dependency('tilt')
  gem.add_dependency('execjs')

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
