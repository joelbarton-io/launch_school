=begin
          if first chr is + , do normal sans +
          if first chr is -, do same, adding - at end
=end

def string_to_signed_integer(integer_as_string)
  numbers = ('0'..'9').to_a
  integer_as_array = integer_as_string.chars
  sign = integer_as_array.shift if integer_as_array[0].eql?('-') || integer_as_array[0].eql?('+')
  
  num = 0
  integer_as_array.reverse.each do |el|
    
  end
end
p string_to_signed_integer('-asdf')