=begin
- Find the length of the longest substring in the given string that is a palindrome.
- A one letter string is a palindrome. 
  
puts longest_palindrome("a") == 1
puts longest_palindrome("aa") == 2
puts longest_palindrome("baa") == 2
puts longest_palindrome("aab") == 2
puts longest_palindrome("baabcd") == 4
puts longest_palindrome("baablkj12345432133d") == 9

i: single string     o: length of the longest substring that also happens to be a palindrome

Considerations: 
  - one letter substrings are palindromes

DS: str -> array of substrings -> op1 -> new_array of pals -> int


high level: 

  - generate all possible substrings 

  - Op 1 -> select those substrings which are palindromes, store in pals_array

  - FIND longest element from pals_array


low level: 

INIT empty array to store substrings

TRAVERSE input_as_array with idx1
  TRAVERSE secondary, with idx2
    PUSh curr to substrings_arr
END

SELECT all elements from substrings_array that are palindromes
  STORE these in pals_arr

FIND longest based on el's size 
=end
def get_substrings(str)
  cache = []
  (0...str.size).each do |idx1|
    (idx1...str.size).each do |idx2|
      cache << str[idx1..idx2]
    end
  end
  cache
end

def get_palindromes(arr)
  arr.select do |candidate|
    candidate.eql?(candidate.reverse)
  end
end

def longest_palindrome(phrase)
  subs_arr = get_substrings(phrase)
  pals_arr = get_palindromes(subs_arr)
  pals_arr.max_by(&:size).size
end

puts longest_palindrome("a") == 1
puts longest_palindrome("aa") == 2
puts longest_palindrome("baa") == 2
puts longest_palindrome("aab") == 2
puts longest_palindrome("baabcd") == 4
puts longest_palindrome("baablkj12345432133d") == 9

# time to completion: ~ 17:00