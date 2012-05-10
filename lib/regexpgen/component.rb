module Regexpgen
  class Component
    WILD_CARD_CHARACTER = "."
    
    @@special_characters = ["?", "^", "$", "/", "\\", "[", "]", "{", "}", "(", ")", "+", "*", "." ]

    # Dot matches any character with the exception of a newline
    def self.match_any_character
      WILD_CARD_CHARACTER
    end
    
    def self.match_this_character(c)
      if @@special_characters.include?(c)
        return "\\" + c
      else
        c
      end
    end
    # A character class is an explicit list of characters placed inside the regexp in square brackets
    def self.match_either_or(first, second)
      "[#{first}#{second}]"
    end
    
    def self.match_range(range)
      "[#{range}]"
    end
    
    def self.match_ranges(ranges)
      "[#{ranges.join}]"
    end
    
    def self.match_hexadecimal_digit
      match_ranges(['A-F','a-f', '0-9'])
    end
    
    def self.match_any_digit
      '\d'
    end
    
    def self.match_any_alphanumeric_character_or_underscore
      '\w'  
    end
    
    def self.match_any_whitespace_character
      '\s'
    end
    
    def self.match_any_non_digit_character
      '\D'
    end
    
    def self.match_any_non_alphanumeric_character_or_underscore
      '\W'  
    end
    
    def self.match_any_character_except(exclude)
      "[^#{exclude}]"
    end
    
    def self.match_zero_or_one(character)
      "#{character}?"
    end
    
    def self.match_any_non_whitespace_character
      '\S'
    end
  end
end
