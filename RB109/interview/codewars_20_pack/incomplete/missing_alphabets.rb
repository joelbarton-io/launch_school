=begin

i: string containing only letters a-z lowercase
o: missing letters

find missing letters

algorithm

- initialize full alphabet and hash object that contain recurring info
- populate recurring character counting hash 
- calculate the maximum number of times a character is present in input

- populate a new array (max number amount of times) with the characters 
  contained in the default alphabet array that are not contained in the 
  input string
- sort the array, then return string
=end
def missing_alphabets(input_string)
  alphabet = ('a'..'z').to_a
  char_count = Hash.new(0)
  input_string.chars.each {|v| char_count[v] += 1 }
  max_recurring = char_count.values.max

  result = []
  max_recurring.times do
    missing = alphabet.reject do |el| 
      input_string.include?(el) 
    end
    result << missing
  end
  result.join.chars.sort.join
end

p missing_alphabets("bbccddeeffgghhiijjkkllmmnnooppqqrrssttuuvvwwxxy")
=begin
def missing_alphabets(input_string)
  alphabet = ('a'..'z').to_a
  char_count = Hash.new(0)
  input_string.chars.each {|v| char_count[v] += 1 }
  max_recurring = char_count.values.max

  result = []
  max_recurring.times do
    missing = alphabet.reject do |el| 
      input_string.include?(el) 
    end
    result << missing
  end
  result.join.chars.sort.join
end
=end