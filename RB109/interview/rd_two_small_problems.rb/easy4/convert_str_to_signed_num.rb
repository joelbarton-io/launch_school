=begin
          if first chr is + , do normal sans +
          if first chr is -, do same, adding - at end
=end

def string_to_signed_integer(integer_as_string)
  numbers = ('0'..'9').to_a
  integer_as_array = integer_as_string.chars
  
  sign = integer_as_array.shift if integer_as_array[0].eql?('-') || integer_as_array[0].eql?('+')
  result = integer_as_array.reverse.map do |num|
    numbers.index(num)
  end

  signed_number = 0
  result.each.with_index do |num, idx|
    signed_number += num * (10 ** idx)
  end
  sign.eql?('-') ? -1 * signed_number : signed_number
end
p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100