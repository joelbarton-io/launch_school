=begin
i: string, +int
o: => nil, output string int times

algo: int times, print string
=end
def repeat(phrase, count)
  count.times {puts phrase}
end
repeat('Hello', 3)