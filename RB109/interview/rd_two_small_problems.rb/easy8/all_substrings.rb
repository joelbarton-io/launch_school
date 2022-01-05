def substrings(string)
  cache = []
  (0...string.size).each do |start|
    (start...string.size).each do |finish| 
      cache << string[start..finish]
    end
  end
  cache
end
p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]