lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'handlebars-amd-rails'

include Handlebars::Unindent

def fixtures_path
  @fixtures_path ||= File.expand_path('../fixtures', __FILE__)
end

def fixture_path(name)
  "#{fixtures_path}/#{name}"
end

def helper_path
  @helper_path ||= File.expand_path('../helper', __FILE__)
end

def helper(name)
  File.new("#{helper_path}/#{name}")
end
