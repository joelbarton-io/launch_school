=begin
Given two words, how many string do you have to remove from them to make them anagrams?

Example
First word : c od e w ar s (4 string removed)
Second word : ha c k er r a nk (6 string removed)
Result : 10

A word is an anagram of another word if they have the same string.
Do not worry about case. All inputs will be lowercase.

i: two words    o: count total string needed to delete to make anagrams

=end

# def anagram_difference(string, string2)
#   all_string = string.chars + string2.chars
#   one = all_string.uniq - string.chars
#   two = all_string.uniq - string2.chars
#   one.size + two.size
# end

# p anagram_difference('aaaaasdfzxcv', 'asdfjkl')
=begin

TRAVERSE input's indices
  INIT temp string to current letter
  TRAVERSE  

=end

# def longest(string)
#   return string if string.size.eql?(1)
#   cache = []
#   string_length = string.size - 1

#   0.upto(string_length) do |start_idx|
#     temp = string[start_idx]
    
#     (start_idx + 1).upto(string_length) do |last_idx|
#       break unless temp[-1] <= string[last_idx]
#       temp << string[last_idx]
#     end
#     cache << temp
#   end
#   cache.max_by(&:size)
# end
=begin

Algo:
CONVERT strs to array(s)

Iterate over one of the arrays
  check if current letter is found in other array
    if yes
      -> reassign that index letter to ''
      -> push curr to shared arr

=end
def diff(str, str2)
  arr1, arr2 = str.chars, str2.chars
  shared = []
  arr1.each do |chr|
    if arr2.include?(chr)
      arr2[arr2.index(chr)] = ''
      shared << chr
    end
  end
  (str.size - shared.size) + (str2.size - shared.size)
end

p diff('codewars', 'hackerrank')

=begin 
again
=end
def anagram_difference(str_1, str_2)
  return 0 if str_1.empty? && str_2.empty?
  arr_1, arr_2 = str_1.chars, str_2.chars
  shared_letters = []
  
  count = 0
  loop do
    if arr_2.include?(arr_1[count])
      chr_idx = arr_2.index(arr_1[count])
      arr_2.delete_at(chr_idx)
      shared_letters << arr_1[count]
    end
    count += 1
    break if count > arr_1.size
  end
  p shared_letters
  (str_1.size - shared_letters.size) + (str_2.size - shared_letters.size)
end

p anagram_difference('', '') == 0
p anagram_difference('a', '') == 1
p anagram_difference('', 'a') == 1
p anagram_difference('ab', 'a') == 1
p anagram_difference('ab', 'ba') == 0
p anagram_difference('ab', 'cd') == 4
p anagram_difference('aab', 'a') == 2
p anagram_difference('a', 'aab') == 2
p anagram_difference('codewars', 'hackerrank') == 10