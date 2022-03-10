=begin


Write a function that will return the count of distinct case-insensitive alphabetic 
characters and numeric digits that occur more than once in the input string. The input 
string can be assumed to contain only alphabets (both uppercase and lowercase) and numeric digits.

i: string object    o: integer count of letters that occurred more than once

explicit req
  -> case-insensitive: 'a' and 'A' count as equals, increments count by 1
  -> input is always alpha-numeric; no symbols
  -> 
ds: str -> |standardize case| -> |tally up letters occurences| -> hash -> |op3| -> values arr -> |op4| -> int

algo:

STANDARDIZE case of string
TALLY up letter counts -> hash
GET values from letter_count hash

select numbers if curr > 1  -> arr
GET size of arr generated from previous step

Example
"abcde" -> 0 # no characters repeats more than once
"aabbcde" -> 2 # 'a' and 'b'
"aabBcde" -> 2 # 'a' occurs twice and 'b' twice (`b` and `B`)
"indivisibility" -> 1 # 'i' occurs six times
"Indivisibilities" -> 2 # 'i' occurs seven times and 's' occurs twice
"aA11" -> 2 # 'a' and '1'
"ABBA" -> 2 # 'A' and 'B' each occur twice
=end

def duplicate_count(string)
  return 0 if string.size.zero?
  letter_counts = string.downcase.chars.tally
  letter_counts.values.select {|num| num > 1}.size
end

p duplicate_count("")  == 0
p duplicate_count("abcde")  == 0
p duplicate_count("abcdeaa")  == 1
p duplicate_count("abcdeaB") ==  2
p duplicate_count("Indivisibilities") ==  2

# finished in 13 minutes
