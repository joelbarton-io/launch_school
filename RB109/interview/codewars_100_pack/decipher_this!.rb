=begin

considerations: 
- only letters and spaces
- need to access ordial of first letter
- probably looking at a nexted loop situation

data-structure:
arrays and strings

Examples:
decipherThis('72olle 103doo 100ya'); // 'Hello good day'
decipherThis('82yade 115te 103o'); // 'Ready set go'

Algo:
- split words by white spaces
  - split individual word into its composite characters
  - perform operations
    - maybe use temporary variables to store second and last letter?
  - swap and merge letters and integers
- return new string
=end
def decipher_this(string)
  
  characters = string.split(' ').map do |word|
    nums = word.chars.partition { |char| char.to_i.to_s.eql?(char) }.join
    letters = word.chars.find_all { |char| char.to_i.to_s != char }.join
    nums.to_i.chr + letters
  end

  characters.map do |word|
    if word.length > 1
      ending = word[-1]
      second = word[1]
      word[1] = ending
      word[-1] = second
      word
    else
      word
    end
  end.join(' ')
end

p decipher_this("65 119esi 111dl 111lw 108dvei 105n 97n 111ka")