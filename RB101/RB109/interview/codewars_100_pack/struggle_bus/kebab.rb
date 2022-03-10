=begin

i: camelCas3String
o: camel-cas-string

rules:
  -> output is all lowercase letters notwithstanding '-'
  -> output does not have non alphabetical characters (clean input of nums and sy)
  

algo:
INIT alphabetical array (all cases)
CONVERT str to arr_of_letters 
REMOVE non-alphabetical characters


CHECK where uppercase are present -> TRAVERSE arr_of_chars -> helper method for getting uppers
  GET all uppercase letters from arr_of_chars
  GET indices of the locations of these uppercase letters, these define our word groupings/separations
  
  
INSERT a kebab marker directly before uppercase letters
CONVERT all to downcase and return as a string
  
ex: myCamelHas3Humps                            -> my-camel-has-humps

ds:  str -> arr (of chars) cleaned -> |operation| -> new_str  
 
 HELPER
GET uppers
  TRAVERSE array of chars (select)
    IF a letter is uppercase then select it
    OTHERWISE, go next

arr of uppercase letters 
GET index of each alpahbetical letter

insert marker at index -1
  
  
=end

def kebabize(str)
  letters = [*'a'..'z','A'..'Z']
  arr = str.chars
  arr = arr.select {|chr| letters.include?(chr)}
  p arr
#   uppercase_letters = get_uppercase(arr)
#   p arr
#   p uppercase_letters
#   indices_of_upper = get_indices(uppercase_letters, arr)
  
  
#   indices_of_upper.each do |idx|
#     arr.insert(idx, '-')
#   end
#   arr.join
end

def get_uppercase(arr)
  capitals = [*'A'..'Z']
  arr.select do |chr|
    capitals.include?(chr)
  end
end

def get_indices(uppers, arr)
  indices = []
  uppers.each do |letter|
    indices << arr.index(letter)
  end
  indices
end


