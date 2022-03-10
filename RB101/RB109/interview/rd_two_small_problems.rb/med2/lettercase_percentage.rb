def letter_percentages(input_str)
  
  divisor = input_str.size
  alphabet = ('a'..'z').to_a + ('A'..'Z').to_a
  arr = input_str.chars
  
  upper = 0
  lower = 0
  neither = 0
  
  arr.each.with_object([]) do |letter, array|
    alphabet.include?(letter) ? letter.upcase.eql?(letter) ? array += 1 : lower += 1 : neither += 1
  end
  
  [ [:lowercase, 100 * (lower/divisor.to_f)], [:uppercase, 100*(upper/divisor.to_f)], [:neither, 100 * (neither/divisor.to_f)]].to_h
  
end