def integer_to_string(number)
  return "+#{number}" if number > 0
  str_nums = ('0'..'9').to_a
  output = ""
  if number < 0
    
  end
end
p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'