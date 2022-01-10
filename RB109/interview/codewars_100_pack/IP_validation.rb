=begin

input: single string object   output: returns true or false

valid:
- 4 groupings
- no leading zeros, unless 0 is the only element in group
- group values are between O and 256, no non-integers

algo:
- split groupings into strings by '.'
- filter out inputs with non-4 lengths
- filter out inputs where there is a leading zero
- filter out inputs with groupings that have integer values greater than 256

- if input passes all of the above, return true
=end

def is_valid_ip(ip)
  array = ip.split('.')
  if no_white_space_or_sym?(array) && right_leng?(array) && no_leading_zero?(array) && under_256?(array)
    true
  else
    false
  end
end

def no_white_space_or_sym?(arr)
  arr.none? { |str| str.include?(' ') || !!str.match?(/-/) }
end

def right_leng?(arr)
  arr.size == 4
end

def no_leading_zero?(arr)
  arr.none? { |str| str[0] == '0' && str.length > 1 }
end

def under_256?(arr)
  arr.all? { |str| str.to_i < 257 }
end

p is_valid_ip('1.1.1.1') # t
p is_valid_ip('123,45,67,89') # f
p is_valid_ip(' 1.2.3.4') # f
p is_valid_ip('1.2.3.4') # t
p is_valid_ip('1.2.3.4 ') # f 
p is_valid_ip('023.45.67.89') # f
p is_valid_ip('01.2.3.4') # f
p is_valid_ip('11.254.13.24') # t   issue -> sample test
p is_valid_ip('11.256.103.04 ') # f
p is_valid_ip('-1.2.3.4') # f       issue-> used .match and regex
p is_valid_ip('1.2.3.4.5') # f