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


def longest(string)
  return string if string.size.eql?(1)
  cache = []
  string_length = string.size - 1

  0.upto(string_length) do |start_idx|
    temp = string[start_idx]
    
    (start_idx + 1).upto(string_length) do |last_idx|
      break unless temp[-1] <= string[last_idx]
      temp << string[last_idx]
    end
    cache << temp
  end
  cache.max_by(&:size)
end
=begin

TRAVERSE input's indices
  INIT temp string to current letter
  TRAVERSE  