# East or West
# You will be given an array of string "east" formatted differently every time. Create a function that returns "west" wherever there is "east". Format the string according to the input. Check the examples below to better understand the question.
  
# p direction(["east", "EAST", "eastEAST"]) == ["west", "WEST", "westWEST"]
# p direction(["eAsT EaSt", "EaSt eAsT"]) == ["wEsT WeSt", "WeSt wEsT"]
# p direction(["east EAST", "e a s t", "E A S T"]) == ["west WEST", "w e s t", "W E S T"]

# The input will only be "east" in different formats.

=begin
i: arr      o: arr with modified elements

considerations: 

our solution needs to be case sensitive
maintain spaces where there are spaces
  keep track of case
  maintain spaces

ds: arr -> string -> chr -> operations

high level:

intaking array of easts
traverse words
  traverse the characters of the current word
    - KEEP track of case
    - MAINTAIN spaces
    - after modification - return back to string type
  end inner traversal
end outer

return a new_arr containing the modifed string elements

implementation level:

TRAVERSE input of elements
  CONVERT element -> array -chrs method
    on each chr, consider case and letter   -> do some checks on case first, then letter 
      MAINTAIN case and spaces
        if 'e' or "E' -> 'w' or 'W'
        if 'a' or 'A' -> 'e' or "E'
        otherwise just go next, implicitly returning unmodified chr
      JOIN composite chrs to modified words again
RETURN array
=end

def direction(array)
  result = array.map do |word|
    word.chars.map do |letter|
      if letter.eql?('e') || letter.eql?('E')
        letter.eql?('e') ? 'w' : 'W' 
      elsif letter.eql?('a') || letter.eql?('A')
        letter.eql?('a') ? 'e' : 'E'
      else
        letter
      end
    end.join
  end
  p result
end
p direction(["east", "EAST", "eastEAST"]) == ["west", "WEST", "westWEST"]
p direction(["eAsT EaSt", "EaSt eAsT"]) == ["wEsT WeSt", "WeSt wEsT"]
p direction(["east EAST", "e a s t", "E A S T"]) == ["west WEST", "w e s t", "W E S T"]


# # In this Kata you have to create a function,named insertMissingLetters,that takes in a string and outputs the same string processed in a particular way.

# # The function should insert only after the first occurrence of each character of the input string, all the alphabet letters that:

# # -are NOT in the original string
# # -come after the letter of the string you are processing

# # Each added letter should be in uppercase, the letters of the original string will always be in lowercase.

# # Example:
# # input: "holly"
# # missing letters: "a,b,c,d,e,f,g,i,j,k,m,n,p,q,r,s,t,u,v,w,x,z"

# # output: "hIJKMNPQRSTUVWXZoPQRSTUVWXZlMNPQRSTUVWXZlyZ"

# # You don't need to validate input, the input string will always contain a certain amount of lowercase letters (min 1 / max 50).

# Input: String (lowercase) 
# Output: String 

# Explicit:
#   - Insert only after the first occurrence of each character of the input string:
#     - Alpahbet letters that are not in the original string
#     - come after the letter of the string you are processing
#     - Each added letter is uppercase. 

# Mental Model:
#   - Build string from empty string:
#   - Generating sequence/list of alphabet letters. 
#     - Remove the letters that are in the input string. 
#   - Going over the input string to access each character. 
#     - Find the index of the letter in the current iteration
#       - Slice out the range of alphabet letters to add.
#     - Add the character to the string + slice (uppercased)
#     - Condition: If the current letter is included in the string I'm building, then I'll only add that letter to the string being built. 
#     - Return the string I built. 

# DS: Constant (array)

# Algorithm:
#   - Initialize a constant ALPHABET, set to letters a-z.
#   - Set a variable built_string = ""
#   - Delete the letters from ALPHABET and save to variable letters_to_add. 
#   - Iterate over the input string's indices:
#     - If the current letter is not included in the built_string
#       - Return the index of the character in ALPHABET. 
#       - Slice out the range from index + 1 up to last letter. 
#       - current char + upcased range of letters to built_string. 
#     - Else 
#       - Add the char 
#   - Return the built string.

ALPHABET = ("a".."z").to_a 

def insert_missing_letters(string)
  built_string = ""
  #letters_to_add = ALPHABET.join.delete(string)
  (0...string.length).each do |i|
    if !built_string.include?(string[i])
      index = ALPHABET.find_index(string[i])
      slice_to_add = ALPHABET[index + 1..-1].join.delete(string).upcase 
      built_string += string[i] + slice_to_add
    else
      built_string += string[i]
    end
  end
  built_string
end


p insert_missing_letters("hello")
p insert_missing_letters("hello") == "hIJKMNPQRSTUVWXYZeFGIJKMNPQRSTUVWXYZlMNPQRSTUVWXYZloPQRSTUVWXYZ"
