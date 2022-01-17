def add(nth)
  sum = 0
  seed = [0, 1]
  
  loop do
    sum += seed.first if seed.first.even?
    next_fib = seed.sum
    break if next_fib >= nth
    seed.push(next_fib)
    seed.shift
  end
  p sum
end