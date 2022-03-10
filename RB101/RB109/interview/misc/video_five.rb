=begin

'Find the length of the longest substring in the given string that is the same in reverse.'
As an example, if the input was 'I like racecars that go fast', the substring (racecar) length would be 7.
If the length of the input string is 0, the return value must also be 0. 

i: single string obj
o: integer (length of longest palindrome, essentially)

considerations:
  -> GUARD for length of input string of length 0
  -> basically, we're looking for longest palindrome
  
ds: str -> a list of sub_str -> |op| -> integer (length)

algo:
GUARD for the string inputs of length 0

GET all possible, consecutive substrings from input str

SELECT those substrings which are palindromes (same forwards and back)

BASED on ^ set of options, SORT by length and return the longest's length


=end
def get_substrings(string_input)
  cache = []
  (0...string_input.size).each do |start_idx|
    (start_idx...string_input.size).each do |end_idx|
      cache << string_input[start_idx..end_idx]
    end
  end
  cache
end

def longest_palindrome(text)
  return 0 if text.size.eql?(0)
  candidates = get_substrings(text)
  sorted_palindromes = candidates.select {|candi| candi.reverse.eql?(candi)}.sort_by(&:length)
  p sorted_palindromes.last.size
end

p longest_palindrome('a')  == 1
p longest_palindrome('aa') == 2
p longest_palindrome('baa') == 2
p longest_palindrome('aab') == 2
p longest_palindrome('baabcd') == 4  
p longest_palindrome('baablkj12345432133d') == 9


