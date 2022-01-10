=begin
You'll be given a string of random characters (numbers, letters, and symbols). To decode this string into the key we're searching for:

(1) count the number occurences of each ascii lowercase letter, and

(2) return an ordered string, 26 places long, corresponding to the number of occurences for each corresponding letter in the alphabet.

For example:

'$aaaa#bbb*cc^fff!z' gives '43200300000000000000000001'
   ^    ^   ^  ^  ^         ^^^  ^                   ^
  [4]  [3] [2][3][1]        abc  f                   z
  
'z$aaa#ccc%eee1234567890' gives '30303000000000000000000001'
 ^  ^   ^   ^                    ^ ^ ^                    ^
[1][3] [3] [3]                   a c e                    z
Remember, the string returned should always be 26 characters long, and only count lowercase letters.

Note: You can assume that each lowercase letter will appears a maximum of 9 times in the input string.


i: string         o: ordered string of stringified integers

explicit:
  -> count the number of occurences of each LOWERCASE letter (only counts lowercase letters)
  -> return ordered string of length: 26
  -> each lowercase letter will only appear a max of 9 times in the input. 

ds: str |op| -> arr |op2| -> hash object |op3| -> array -> str

algo:

CLEAN input string  ->  (downcase everything, convert to array)
                    -> GENERATE new_arr that only contains lowercased, alphabetical characters

GENERATE alphabet hash -> keys as letters, values as occurences (init: 0)
POPULATE our alphabet hash's values (letter occurences)

GET our values in a string representation, return -> that

=end
def decrypt(dirty_string)
  low_alpha = ('a'..'z').to_a
  dirty_string.downcase!
  dirty_array = dirty_string.chars 

  clean_array = dirty_array.select do |chr|
    low_alpha.include?(chr)
  end

  alpha_hash = low_alpha.each.with_object({}) do |letter, hsh|
    hsh[letter] = 0
  end
  
  clean_array.each do |letter|
    alpha_hash[letter] += 1
  end
  alpha_hash.values.join
end

p decrypt('$aaaa#bbb*ccfff!z') == '43200300000000000000000001'
p decrypt('z$aaa#ccc%eee1234567890') == '30303000000000000000000001'
p decrypt('the quick brown fox jumps over the lazy dog') == '11113112111111411212211111'

# time to completion: ~20:00