def leading_substrings(string)
  result = []
  (1..string.size).each do |n|
    result << string.slice(0, n)
  end
  result
end
p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']