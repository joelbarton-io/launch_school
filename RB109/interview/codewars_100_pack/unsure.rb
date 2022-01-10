=begin
      -> Find the longest substring in alphabetical order.
      -> Example: the longest alphabetical substring in "asdfaaaabbbbcttavvfffffdf" is "aaaabbbbctt".
      -> There are tests with strings up to 10 000 characters long so your code will need to be efficient.
      -> The input will only consist of lowercase characters and will be at least one letter long.
      -> If there are multiple solutions, return the one that appears first.

high level

input -> str -> arr -> STEPS:
                            COLLECT all alphabetical substrings efficiently
                            GET the first, largest alphabetical substring -> output

low level

as soon as a substring is no longer ascending alphabetically, 
  PUSH that string to a storage, 
  BEGIN again at curr chr

=end
def longest(string)
  temp = string[0]
  cache = []
  (1..11).each do |idx|
    
    if temp[-1].ord <= string[idx].ord
      temp += string[idx]
    else
      cache << temp
      temp.clear
      temp = string[idx] if temp.empty?
    end
  end
  p cache
end
# p longest('asd') == 'as'
# p longest('nab') == 'ab'
p longest('abcdeapbcdef') == 'abcde'
# p longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt'
# p longest('asdfbyfgiklag') =='fgikl'
# p longest('z') == 'z'
# p longest('zyba') == 'z'