=begin
Create a function that turns a string into a Mexican Wave. 
You will be passed a string and you must return that string in an array where an 
uppercase letter is a person standing up. 

i: string         o: array of input string with ascending indexed capitalized letters

expl/impl considerations
  -> number of letters to capitalize equals number of letters in input string
  -> return early if input string is either empty or lacking letters

ds: str -> |get letter_count| -> int -> |iterate until lc reached| -> arr of str

algo:
CONVERT input to array of lowercase characters
INIT alphabet (arr) -> used to check if chr is alphabetical
INIT storage 

TRAVERSE string_chr_array
  curr chr alphabetical?
    N? -> go next
    Y?
    -> get a 'copy' of array
    -> delete curr chr and capitalize
    -> push whole word to storage array
  Loop...
Finished.

=end
def wave(string)
  arr = string.downcase.chars
  cache = []
  alphabetic = [*'a'..'z']
  arr.each.with_index do |chr, idx|
    next unless alphabetic.include?(chr)
    sliced = arr.slice(0..)
    upcased = sliced.delete_at(idx).upcase
    cache << sliced.insert(idx, upcased).join
  end
  cache
end
p wave("hello") #== ["Hello", "hEllo", "heLlo", "helLo", "hellO"]