=begin

Given an array of strings made only from lowercase letters, return an array of all 
characters showing up in all strings within the given array (including duplicates). 

For example, if a character occurs 3 times in all strings but not four times, you need to 
include that character three times in the final answer.

We want to return an array of the letters that are present in each element in our input array [(string), string2]

goal:  arr of strs  ->  arr of shared chrs

rules:
-> include duplicate letters if they appear in all elements
-> duplicates MUST be preserved

main challenge -> I need a way of removing elements from the other words without removing duplicates


traverse the characters of the first word
  
  if the curr character is included in all the other words
  -> get index of that chr in the other words, and remove the letter at that index -> or replace with ''
    -> cant use delete -> could use delete at with index of the shared character
  

algo:

INIT output cache
STORE first word in a variable by shifting first element out of the input

LOOP the length of the word
  ACCESS curr chr
    TRAVERSE shortened input array
      CHECK each element for the curr chr (all?)
        INCLUDED in all elements?
          -> push curr chr to output cache
          -> get idx of curr chr in element, delete at that index (word in array)
          
        OTHERWISE -> next character

return output cache

=end
require 'pry'

def common_chars(array)
  cache = []
  first_word = array.shift
  
  (0...first_word.size).each do |idx|
    curr_letter = first_word[idx]
    binding.pry
    if array.all? {|word| word.include?(curr_letter)}
      cache << curr_letter
      
      array = array.map do |word|
        word_as_chrs = word.chars
        idx_of_shared = word_as_chrs.index(curr_letter)
        word_as_chrs.delete_at(idx_of_shared)
        word_as_chrs.join
      end
    end
  end
  cache
end

# p common_chars(['bella', 'label', 'roller']) == ['e', 'l', 'l']
# p common_chars(['cool', 'lock', 'cook']) == ['c', 'o']
# p common_chars(['hello', 'goodbye', 'booya', 'random']) == ['o']
p common_chars(['aabbaaaa', 'ccdddddd', 'eeffee', 'ggrrrrr', 'yyyzzz']) == []

# this one took me just over 25 minutes
