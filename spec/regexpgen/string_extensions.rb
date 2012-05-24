class String
  def has_match?(input)
    self =~ Regexp.new(input)
  end
end  

