=begin
i: plaintext       o: boolean

explicit -> case is irrelv

keyword: pangram -> is true if input string contains all letters in the alphabet 


ds: str -> arr |op to comp| -> boolean t/f

algo: 

CONVERT input to lowercase -> arr
INIT an alphabet -> ds: hash object    letter : boolean (false) initially (each with object)

TRAVERSE input letters 
CHECK if chr is alpahbetical
  -> YES? -> switch value to true in alphabet hash for that letter
  -> NO? -> go next
DONE 

get values from alphabet hash -> arr of booleans
  IF all are true, return true
  Otherwise, return false

=end
def pangram?(plaintext)
  plaintext = plaintext.downcase.chars
  alphabet_arr = [*'a'..'z']

  alphabet_hash = alphabet_arr.each.with_object({}) do |chr, hsh|
    hsh[chr] = false
  end

  plaintext.each do |chr|
    alphabet_hash[chr] = true if alphabet_hash.has_key?(chr) 
  end

  hash_values = alphabet_hash.values
  hash_values.all? {|el| el.eql?(true)}
end

p pangram?("The quick brown fox jumps over the lazy dog.") == true
p pangram?("This is not a pangram.") == false