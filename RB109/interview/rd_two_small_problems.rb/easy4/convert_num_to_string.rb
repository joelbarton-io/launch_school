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
p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'
