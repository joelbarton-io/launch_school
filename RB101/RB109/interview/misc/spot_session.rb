# Multiplicative Persistence
# Numberphile does a great video on multiplicative persistence which you can see here https://www.youtube.com/watch?v=Wim9WJeDTHQ

# This is a resource that discusses the smallest numbers with a given persistence
# https://oeis.org/A003001

################

# Problem
# Determine the multiplicative persistence of a given integer where the mutiplicative persistence is the number of times you need to multiply the digits together before reaching a single digit. Assume that the input will always be a positive integer.

# examples:
# 5428 => 5*4*2*8 = 320 => 3*2*0 = 0      #2
# 327 => 3*2*7 = 42 => 4*2 => 8           #2

# test cases
# p mult_persistence(8)                 == 0
# p mult_persistence(18)                == 1
# p mult_persistence(5428)              == 2
# p mult_persistence(327)               == 2
# p mult_persistence(467)               == 4
# p mult_persistence(1847)              == 3
# p mult_persistence(277777788888899)   == 11



# checking assumptions via examples
# single integer argument returns 0

# algorithm

# objective: find the number of times I need to multiply the digits of the given integer until I reach a single integer

# input: integer

# return 0 if the length of the given integer is 1

# count the number of times that the integers are multiplied
  #  - increment counter each time the multiplication process is complete

# split the given integer into its digits and multiply them together
  #  - split integer into its digits
  #  - multiply digits together
  #    - integer.to_s.chars.map {|string| string.to_i }.reduce(:*)

# repeat the splitting and multiplying process until the output digit is a single number
  #  - until the output integer length is 1
  #  - continue the multiplying process

# output: integer

def split_multiply(int)
  int.to_s.chars.map {|string| string.to_i }.reduce(:*)
end

def mult_persistence(integer)

  count = 0
  
  until integer.digits.size.eql?(1) do
    integer = split_multiply(integer)
    count += 1
  end
  count
end



p mult_persistence(8)                 == 0

p mult_persistence(18)                == 1
p mult_persistence(5428)              == 2
p mult_persistence(327)               == 2
p mult_persistence(467)               == 4
p mult_persistence(1847)              == 3
p mult_persistence(277777788888899)   == 11


# Problem
# Return an array of the smallest numbers with persistence between 0 and 8. Assume that all of the numbers will be between 0 and 5_000_000

# p smallest_mult_persistence == [0, 10, 25, 39, 77, 679, 6788, 68889, 2_677_889]

# Note, the array is known out to a persistence of 11, but the computations take a long time to compute, so to make it more reasonable we limit it to persistence 8.
# Here is the full array if you want to try it.
# p smallest_mult_persistence == [0, 10, 25, 39, 77, 679, 6788, 68889, 2_677_889, 26_888_999, 3_778_888_999, 277_777_788_888_899]
