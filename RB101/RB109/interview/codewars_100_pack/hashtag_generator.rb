=begin

All words must have their first letter capitalized.
If the final result is longer than 140 chars it must return false.
If the input or the result is an empty string it must return false.
Examples
" Hello there thanks for trying my Kata"  =>  "#HelloThereThanksForTryingMyKata"
"    Hello     World   "                  =>  "#HelloWorld"
""                                        =>  false

i: str        o: modified str (cannot be longer than 140 chrs in length)

explicit:
  -> length < 140 
  -> regardless of how many empty spaces there are, spaces do not count as chrs
  -> we only 'count' characters and '#'

  -> must handle single words
  -> '          ' is still just an empty string -> return false

  -> if input or result is '' -> return MUST be false


algo: str -> |guard clause| -> |op1| -> |op2| -> #mod str

Check if input is empty string, if so return false

CONVERT input string into array
TRAVERSE array elements
  -> capitalize word
END -> join by ''
return # + new_str

=end
def generateHashtag(string)
  return false if string.split(' ').join.size.zero? 
  new_str = string.split(' ').map(&:capitalize)}.join('')
  
  final_word = "#"+new_str
  (final_word.size <= 140) ? final_word : false
end

p generateHashtag(" Hello there thanks for trying my Kata")

# time: 14 minutes
