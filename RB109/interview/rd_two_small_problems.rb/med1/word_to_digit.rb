=begin

i: string

ds: array of words with relative numbers as indices key
  str -> arr of words -> |operation| -> arr -> str

algo:
INIT a array filled with strings (zero, one ,...)
CONVERT str -> array of words
TRAVERSE str_of_words 
  CHECK if curr included in our key of numbers
    YES -> substitute word for index of match from key of words
    NO -> leave word alone
  JOIN words together
return that string of words with updated stringified integers

=end

def word_to_digit(input_string)
  acceptable = [*'a'..'z', 'A'..'Z']
  numbers_arr = %w(zero one two three four five six seven eight nine)
  words_arr = input_string.split(' ')

  sentence = words_arr.map do |word|
    if !acceptable.include?(word[-1])

      if numbers_arr.include?(word[0..-2]) 
        numbers_arr.index(word[0..-2]) 
      else
        word
      end
    end
  end.join(' ')
  p sentence
end


p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'