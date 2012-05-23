require 'spec_helper'
require "regexpgen/component"

module Regexpgen

  describe "Examples of patterns" do

    it "should return . for wildcard character that means match any character" do
      result = Component.match_any_character
      result.should == "."
    end

    it "should return 'a' for non-special character 'a'" do
      result = Component.match_this_character('a')
      result.should == 'a'
    end

    it "should return back slash pre-pended to all special characters" do

      SPECIAL_CHARACTERS = ["?", "^", "$", "/", "\\", "[", "]", "{", "}", "(", ")", "+", "*", "." ]

      data_driven_spec(SPECIAL_CHARACTERS) do |special_character|
        result = Component.match_this_character(special_character)
        result.should == "\\#{special_character}"      
      end  
    end

    it "can impose constraints on matches to reduce the matches using character classes" do
      result = Component.match_either_or('d', 'r')
      result.should == "[dr]"
    end

    it "character classes can also insert a range of characters" do
      result = Component.match_range('a-z')
      result.should == "[a-z]"    
    end

    it "character classes can handle multiple ranges" do
      result = Component.match_ranges(['A-F','a-f', '0-9'])
      result.should == "[A-Fa-f0-9]"
    end

    it "should match a hexadecimal digit" do
      result = Component.match_hexadecimal_digit
      result.should == "[A-Fa-f0-9]"    
    end

    it "should match any character except those on a special list" do
      result = Component.match_any_character_except('A-Fa-f0-9')
      result.should == "[^A-Fa-f0-9]"      
    end

    it "should match any digit" do
      result = Component.match_any_digit
      result.should == '\d'          
    end

    it "should match any digit, alphabetical character or underscore" do
      result = Component.match_any_alphanumeric_character_or_underscore
      result.should == '\w'              
    end

    it "should match any whitespace character (space, tab, newline)" do
      result = Component.match_any_whitespace_character
      result.should == '\s'                    
    end

    it "should match any character that isn't a digit" do
      result = Component.match_any_non_digit_character
      result.should == '\D'                        
    end

    it "should match any character other than an alphanumeric character or underscore" do
      result = Component.match_any_non_alphanumeric_character_or_underscore
      result.should == '\W'                            
    end

    it "should match any non-whitespace character" do
      result = Component.match_any_non_whitespace_character
      result.should == '\S'                                
    end

    it "should match zero or one character" do
      result = Component.match_zero_or_one('s')
      result.should == 's?'                                    
    end

    it "should match zero or more character" do
      result = Component.match_zero_or_more('s')
      result.should == 's*'                                    
    end

    it "should match one or more character" do
      result = Component.match_one_or_more('s')
      result.should == 's+'                                    
    end

    it "should match exactly given number of digits" do
      result = Component.match_digits_exactly(3)
      result.should == '\d{3}'                                    
    end

    it "should match any string containing a given range" do
      result = Component.match_digits_with_range(1,10)
      result.should == '\d{1,10}'                                    
    end

    it "should match n or more repetitions" do
      result = Component.match_n_or_more(4)
      result.should == '\d{4,}'                                    
    end

    it "should match beginning of the string" do
      result = Component.match_begins_with
      result.should == '\A'                                    
    end

    it "should match word boundary" do
      result = Component.match_word_boundary
      result.should == '\b'                                    
    end    

    it "should match beginning of the string" do
      result = Component.match_does_not_begin_with
      result.should == '^'                                    
    end    

    private
    # This must be extracted to a test utility gem that can be  used with
    # any test framework
    def data_driven_spec(container)
      container.each do |element|
        yield(element)
      end
    end
    # Plain language patterns
    # "The letter a, followed by a digit"
    # "Any uppercase letter, followed by at least one lowercase letter"
    # "Three digits, followed by a hyphen, followed by four digits"

    # Pattern that include components and constraints related to positioning inside the string
    # "The beginning of a line, followed by one or more white space characters"
    # "The character . (period) at the end of a string"
    # "An uppercase letter at the beginning of a word"
    # The beginning of a line - Pattern component
    # Simple matching
    # Literal characters, meaning "match this character"
    # The dot wildcard character (.), meaning "match any character"

  end
end