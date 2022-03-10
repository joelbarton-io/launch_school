=begin
- determine if number divisible by 3 or 5
- if it is, then add that number to sum counter
- return number
=end

def find(n)
  sum = 0
  counter = 1

  until counter > n
    if div_by?(counter)
      sum += counter
    end
    counter += 1
  end
  sum
end

def div_by?(candidate)
  (candidate % 3).zero? || (candidate % 5).zero?
end

p find(-1)