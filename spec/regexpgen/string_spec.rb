require_relative 'string_extensions'

describe "StringExtensions" do
  
  it "should match a given string" do
    result = "catch".has_match?("cat")
    
    result.should == 0
  end
  
  it "should match a given string found at the end" do
    result = "catch".has_match?("ch")
    
    result.should == 3    
  end
end