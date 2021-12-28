=begin

i: two strings
o: number of letters need to remove from both strings for them to be anagrams

problem considerations:

data-structure: arrays and strings

algo:
- split first string into array object
- traverse array object, 
  - check if current element is in second string
  - if it is, select that element
  - if not, go next
- 
- based on the diff between selected's length and the resepctive lengths of the two strings,
  calculate result
- return result
=end

def anagram_difference(word_1, word_2)
  return if word_1.size.zero? && word_2.size > 0

  word_2_array = word_2.chars
  shared = word_1.chars.select do |char| 
    if word_2.include?(char)
      idx = word_2_array.find_index(char)
      word_2_array.delete_at(idx)
      p word_2_array
      true
    else
      false
    end
  end.size
  shared_w_1 = word_1.size - shared 
  shared_w_2 = word_2.size - shared

  shared_w_1 + shared_w_2
end

p anagram_difference('codewars', 'hackerrank')