require 'spec_helper'
require "regexpgen/modifier"

module Regexpgen
  describe Regexpgen::Modifier do

    it "should return i for case insensitive regexp match" do
      result = Modifier.case_insensitive
      result.should == 'i'
    end

    it "should return i for case insensitive regexp match" do
      result = Modifier.multiline
      result.should == 'm'
    end
  end  
end
