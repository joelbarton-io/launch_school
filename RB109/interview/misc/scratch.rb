def insert_missing_letters(phrase)
  alpha = ('A'..'Z').to_a
  store = []

  phrase.chars.each do |char|
    idx = alpha.index(char.upcase) + 1
    store << alpha[idx..-1] - phrase.upcase.chars
  end

  letters = ''
  phrase.chars.map.with_index do |char, idx|
    if letters.include?(char)
      char
    else
      letters += char
      char + store[idx].join
    end
  end.join
end
p insert_missing_letters('joell')
=begin
Given a string of words, you need to find the highest scoring word.

Each letter of a word scores points according to its position in the alphabet: a = 1, b = 2, c = 3 etc.

You need to return the highest scoring word as a string.

If two words score the same, return the word that appears earliest in the original string.

All letters will be lowercase and all inputs will be valid.


i: str of words       o: STR with highest count (sub of letter values)


Considerations:  FIND 
-  generate some hash to store letters and respective values 1-26 ('a'..'z').to_a val = idx+1
-  if two words have same score, return word that appears first

ds: str (sentence) -> arr (indiv words) -> operation to get all counts (store in arr)
    -> [wrd1, word2, word3, word4]
    -> max [2, 3, 7, 3]
    -> once we have max num, get index of that maximinum and use that to reference word with     greatest letter value


ALGO:

INIT alphabet array  (relative index +1 == letter count)
CONVERT input string to array of words
INIT letter count array

- get an array of words in the given string
- find the scores for each word and store them
 
- find the highest score [1,2,34]
  - max
- find the highest scoring word which comes first
  - find the index of the highest score in the letter_count_array
  - find the word in array_of_words with that index

Implementation details:



INIT alphabet array  (relative index +1 == letter count)
CONVERT input string to array of words
INIT letter count array

TRAVERSE input array_of_words (man as element)
  INIT curr_count to zero
  TRAVERSE word_as_arr  (chr as element)
    increment curr_count by:INT (IDX +1) -> letter_count_arr.   based on alphabet array indexes, get index of chr
  push curr_count to letter count array

GET max from letter_count array
GET index of MAX -> use that to reference word with greatest letter value, 
RETURN word
=end
def high(phrase)
  alphabet = ('a'..'z').to_a
  words = phrase.split(' ')
  letter_count = []
  
  words.each do |word|
    curr_count = 0
    word.chars.each do |chr|
      curr_count += alphabet.index(chr) + 1
    end
    letter_count << curr_count
  end
  maximum = letter_count.max
  idx_of_max = letter_count.index(maximum)
  words.fetch(idx_of_max)
end
p high('man i need a taxi up to ubud') == 'taxi'
p high('what time are we climbing up the volcano') == 'volcano'
p high('take me to semynak') == 'semynak'
p high('aaa b') == 'aaa'
# time to completion: ~ 28:00