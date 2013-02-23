require_relative './spec_helper'

describe Handlebars::Amd::Rails::Template do

  subject do
    Handlebars::Amd::Rails::Template.new(fixture_path('demo.hbs'))
  end

  describe '#evaluate' do

    before do
      Handlebars.config.template_root = fixtures_path + '/'
      Handlebars::Amd::Rails::Source.stub(:path).and_return(helper('handlebars.js'))
    end

    it 'compiles a template wrapped in a define block' do
      expected = unindent <<-JS
        define(['handlebars'], function(Handlebars) {
          var templates = Handlebars.templates || (Handlebars.templates = {});
          return templates['demo'] = Handlebars.template("Precompiled!");
        });
      JS
      subject.evaluate(nil, nil).should == expected
    end

  end

end
