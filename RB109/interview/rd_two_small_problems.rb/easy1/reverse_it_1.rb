=begin

i: string
o: new_string, words in reverse order

DS: String -> Array -> ops -> new_str -> return new_str
ALGO:

INIT new array obj
SPLIT into individual words (groups of characters separated by whitespace)
TRAVERSE array of words with indexes - choosing to not use the .reverse method here
push element at index -idx - 1 to new array object
=end

def reverse_sentence(phrase)
  reversed = []
  arr = phrase.split
  arr.each.with_index do |_, idx|
    reversed << arr.fetch(-idx - 1)
  end
  p reversed.join(' ')
end
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''