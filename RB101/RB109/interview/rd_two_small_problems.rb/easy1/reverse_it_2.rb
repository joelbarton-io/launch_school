=begin

i: ONE word or phrase
o: new_word or phrase

Considerations: "Spaces should be included only when more than one word is present." 
  -> decide between: chars and split 

ds: START: str -> arr -> OPERATIONS -> new_arr -> new_str -> END

ALGO:
    -SPLIT by ' '
    -CHECK word size
    -  WHEN < 5   ->   word 
    -  OTHERWISE  ->   reverse word
    -return new_arr joined by ' '
=end

def reverse_words(phrase)
  phrase.split.map {|word| word.size < 5 ? word : word.reverse}.join(' ')
end
puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS

# time to completion: 8:20