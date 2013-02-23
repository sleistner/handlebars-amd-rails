require_relative './spec_helper'

describe Handlebars::Config do

  it 'can receive arbitrary options' do
    subject.foo = :bar
    subject.foo.should == :bar
  end

  describe '#to_camelcase' do

    it 'transforms keys to camelcase' do
      subject.foo_bar = :baz
      subject.to_camelcase.should == { 'fooBar' => :baz }
    end

  end

end
