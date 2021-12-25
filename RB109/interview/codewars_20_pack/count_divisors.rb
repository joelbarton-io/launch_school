=begin

input: positive integer
output: number of divisors for that integer

algo:

- generate range of 1 thru input (inclusive)
- iterate over range array passing each and seeing if input is divisible
- divisible? increment counter
return final count

=end
def divisors(number)
  count = 0
  1.upto(num) do |n|
    count += 1 if (num % n).zero?
  end
  count
end
