def get_words(hash)
  characters = hash.each.with_object([]) do |(key, value), arr|
    value.each {|letter| arr << letter * key}
  end.join
  result = []
  characters.chars.permutation {|anagram| result << anagram.join}
  result.uniq.map.sort
end

=begin
i: hash object: count : ['letter', 'letter2']
o: arr of all possible anagrams (arrangements) of letters

reqs:

  -> input values are always lowercase letters
  -> no numbers or special characters
  -> resulting array elements should be sorted alphabetically
  
ds: hash -> arr -> str -> arr of anagrams

algo: 
GENERATE string based on hash key: values
GET all permutations of that string  ^
REMOVE duplicate anagrams (recurring letter 'a')
SORT arr alphabetically
=end