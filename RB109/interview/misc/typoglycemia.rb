=begin
word: group of chrs separated from other groups by a whitespace
'special characters' -> non alphabetical characters %w(. , ' -)

reqs.
  -> input characters are always lowercase
  
GUARD for leng < 4, just return word

SPLIT input by white space
TRAVERSE words
  GUARD for leng < 4, just return word

  HELPER
  for every word, look for any special characters
    -> if they are present, get their index and what they are -> store in a variable
    -> remove this special character
    -> remove first and last -> store in variables
    -> sort remaining letters
    -> add back first and last
    -> add back special char at the proper index
  JOIN back together again
  
=end
def process_word(word)
  need_special = false
  specials = ["'", '.', ',', '-']
  return word if word.size < 4
  word_as_arr = word.chars
  
  if word_as_arr.any? {|chr| specials.include?(chr)}
    the_special = specials.select {|special| word_as_arr.include?(special)}.join
    special_index = word_as_arr.index(the_special)
    word_as_arr.delete_at(special_index)
    needs_special = true
  end
  
  leading     = word_as_arr.shift
  trailing    = word_as_arr.pop
  sorted_word = word_as_arr.sort.join
  word        = leading << sorted_word << trailing
  
  if needs_special
    word_arr = word.chars
    return word_arr.insert(special_index, the_special).join('')
  end
  word
end

def scramble_words(text)
  return text if text.size < 4
  words = text.split(' ')
  words = words.map do |word|
    process_word(word)
  end
  words.join
end
p process_word("you've gotta dance like there's nobody watching, love like you'll never be hurt, sing like there's nobody listening, and live like it's heaven on earth.")