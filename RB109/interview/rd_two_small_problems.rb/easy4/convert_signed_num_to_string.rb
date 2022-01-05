def integer_to_string(number)
  chars = ('0'..'9').to_a
  result = ''
  loop do
    number, remainder = number.divmod(10)
    result << (chars[remainder])
    break if number == 0
  end
  result.reverse
end

def signed_integer_to_string(number)
  sign = number <=> 0
  "#{sign} integer_to_string(sign * number)}"
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'