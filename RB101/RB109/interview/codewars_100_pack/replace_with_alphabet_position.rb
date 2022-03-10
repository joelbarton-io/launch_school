=begin
Given a string, replace every letter with its position in the alphabet.
If anything in the text isn't a letter, ignore it and don't return it.

"a" = 1, "b" = 2, etc.

i: string of words   o: string of string integers (that represent a letter's position in the alphbet)

implicit:
  -> we don't care about case or non-alphabetical chrs

ds: str -> arr -> |core operations| -> string

h.l. algo:
generate a string of integers that represent the indexed location of a alphabetical letter

algo:
INIT an array of letters (downcased)
CONVERT input str (downcase) -> array of dc letters as chr

INIT storage arr
TRAVERSE input_as_arr
  Check if chr is included in our alphabet array
    -> yes? Get index of that letter (+1)
    push this number into our storage arr
    -> no? go next 
FINISH 

JOIN + RETURN storage arr -> str
=end
def alphabet_position(plaintext)
  alphabet = [*'a'..'z']
  chr_arr = plaintext.downcase.chars 
  cache = []
  chr_arr.each do |chr|
    cache << alphabet.index(chr) + 1 if alphabet.include?(chr)
  end
  cache.join(' ')
end
p alphabet_position("The sunset sets at twelve o' clock.") == "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11"
p alphabet_position("-.-'") == ""

# just over 10 minutes