def featured(input)
  loop do
    input += 1
    return "ERROR" if input.digits.size > 10
    next if input.even? || (input%7) != 0
    break if input.digits.reverse.uniq.join.to_i == input
  end
  input
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987
p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements

=begin
conditions:

- odd
- multiple of 7
- all digits occur exactly once

- value of output is always greater than value of input

i: integer                                    o: next featured number or error message
-> input doesnt have to be 'featured'

keyword: 'multiple of 7'    ->    divides evenly by 7 -> % remainder is zero

ds: int -> int |odd?/div_by7| -> arr |get uniq?| -> return next featured number

Algo: 

LOOP -> until conditions are met or failed
  INCREMENT input by 1
  EVEN? -> next one
  DIV_BY_7? -> next one
  ALL_UNIQ? -> if false, next one
             if true, that's our featured number
  if input number is greater 10 digits long, there is not chance of a featured number
Return featured number

# time to completion: 20 minutes
=end