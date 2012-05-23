class String
  def has_match?(input)
    eval("\"#{self}\" =~ \/#{input}\/")
  end
end  

