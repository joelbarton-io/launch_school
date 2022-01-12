=begin
Complete the solution so that it splits the string into pairs of two characters. 
If the string contains an odd number of characters then it should replace the missing 
second character of the final pair with an underscore ('_').

i: str      o: arr of substrings 

question: 
  -> can we we mutate the input string?

implicit:
  -> mutation is ok
  -> i: '' -> early return []

-> 'abc' -> ['ab', 'c_']
-> 'abcdef' -> ['ab', 'cd', 'ef']

ds: -> str -> arr |splitting operation| -> |checking if odd? length op| -> final arr

algo:
RETURN early if i: '' -> []

CONVERT input string -> arr of chrs

INIT empty array : pairs
TRAVERSE our input array (until empty?)
  PUSH first two elements in input arr (destructively) to pairs storage (shift) -> slice!
FINISHED

IF string.length was odd -> add '_' to last element in array
OTherwise...

pairs arr -> filled with pairs

=end
def solution(plaintext)
  cache = []
  arr = plaintext.chars 
  until arr.empty? do
    cache << arr.shift(2).join
  end
  if plaintext.length.odd?
    cache[-1] += "_"
    cache
  else
    cache
  end
end
p solution("abcdef") == ["ab", "cd", "ef"] 
p solution("abcdefg") == ["ab", "cd", "ef", "g_"] 
p solution("") == []

# time to completion: fifteen minutes