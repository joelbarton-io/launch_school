def spin_words(string)
  string
    .split(' ')
    .map {|word| word.length >= 5 ? word.reverse : word }
    .join(' ')
end
=begin
i: string of word or words
o: string

question considerations: 
- input will be only letters and spaces, no symbols
- SAME STRING? -> does this mean we have to mutate the string in place?  
  - has implications on data structure allowed

Ex:
spinWords( "Hey fellow warriors" ) => returns "Hey wollef sroirraw" 
spinWords( "This is a test") => returns "This is a test" 
spinWords( "This is another test" )=> returns "This is rehtona test"

data structure: if we can use arrays, we will. If it has to be the SAME string object, not sure

algo:
- split by spaces
- traverse array of words, 
  - reverse word if it is longer than 5 characters long
  - otherwise, just return word
- join words together as string object

# def spin_words(string)
#   array = string.split(/ /)

#   array.map do |word| 
#     word.length >= 5 ? word.reverse : word
#   end.join(' ')
# end

time to completion: 6:48
=end