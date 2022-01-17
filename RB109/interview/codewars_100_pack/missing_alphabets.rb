=begin
Given string s, which contains only letters from a to z in lowercase.

A set of alphabet is given by abcdefghijklmnopqrstuvwxyz.

2 sets of alphabets mean 2 or more alphabets.

Your task is to find the missing letter(s). You may need to output them by the order a-z. It is possible that there is more than one missing letter from more than one set of alphabet.

If the string contains all of the letters in the alphabet, return an empty string ""

Example
For s='abcdefghijklmnopqrstuvwxy'

The result should be 'z'

For s='aabbccddeeffgghhiijjkkllmmnnooppqqrrssttuuvvwwxxyy'

The result should be 'zz'

For s='abbccddeeffgghhiijjkkllmmnnooppqqrrssttuuvvwwxxy'

The result should be 'ayzz'

For s='codewars'

The result should be 'bfghijklmnpqtuvxyz'

Input/Output
[input] string s
Given string(s) contains one or more set of alphabets in lowercase.

[output] a string
Find the letters contained in each alphabet but not in the string(s). Output them by the order a-z. If missing alphabet is repeated, please repeat them like "bbccdd", not "bcdbcd"


i: string           o: letters needed to make full alphabet (str) 

explicit:
  -> all downcase letters
  -> will need to sort output string (alphabetically)

Keyword: a letter is 'missing' if that letter is needed to complete an alphabet

ds: str -> arr -> hash (letter counts) |comp op| -> arr

algo:

TALLY letter counts into a hash
GET max letter occurence -> this tells us how many 'alphabets' there need to be -> what's missing?
based on this number, GENERATE a diff hash of full alphabet(s)

COMPARE respective values from actual and FULL hashes -> tells us the amount of letter we are missing for each letter

  IF a letter is not present in letter occurence hash, then we need the maximum of that letter
  Otherwise, get the difference amount of letters between the two hashes

  pushing X letters to a storage array

  SOrt storage array -> join return this string
=end
def tally(array)
  array.each.with_object({}) do |chr, hsh|
    hsh.include?(chr) ? hsh[chr] += 1 : hsh[chr] = 1
  end
end

def missing_alphabets(string)
  letters_actual = tally(string.chars)
  number_of_alphabets = letters_actual.max_by {|key, value| value}.last

  result = []
  full_alphabet = tally(('a'..'z').to_a * number_of_alphabets)
  
  full_alphabet.each do |key, value|
    unless letters_actual.include?(key)
      result << key * number_of_alphabets
    else      
      needed = value - letters_actual[key]
      result << key * needed
    end
  end
  result.sort.join
end


p insert_missing_alphabets("abcdefghijklmnopqrstuvwxy") == "z"
p insert_missing_alphabets("abcdefghijklmnopqrstuvwxyz") == ""
p insert_missing_alphabets("aabbccddeeffgghhiijjkkllmmnnooppqqrrssttuuvvwwxxyy") == "zz"
p insert_missing_alphabets("abbccddeeffgghhiijjkkllmmnnooppqqrrssttuuvvwwxxy") == "ayzz"
p insert_missing_alphabets("codewars") == "bfghijklmnpqtuvxyz"