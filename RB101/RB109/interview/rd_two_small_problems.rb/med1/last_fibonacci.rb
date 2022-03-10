def fibonacci_last(nth)
  seed = [1, 1]
  until seed.size.eql?(nth)
    seed << (seed[-1] + seed[-2])
  end
  seed.last.to_s[-1].to_i
  # one, two = 1, 1

  # 3.upto(nth) do
  #   one, two = [two, one + two]
  # end
  # two.digits.first
end

p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
p fibonacci_last(123456789) # -> 4