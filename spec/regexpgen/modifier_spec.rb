require 'spec_helper'
require "regexpgen/modifier"

describe Regexpgen::Modifier do
  
  it "should return i for case insensitive regexp match" do
    result = Regexpgen::Modifier.case_insensitive
    result.should == 'i'
  end

  it "should return i for case insensitive regexp match" do
    result = Regexpgen::Modifier.multiline
    result.should == 'm'
  end
  
  
end