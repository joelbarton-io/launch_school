=begin

problem: 
i: lowercase string, all characters are letters
o: integer length of longest consecutive vowel chain

example:
'codewarriors' => o,e,a,io. => length of 2

data structure:
array of substrings

algo:

first, convert to array
then, initialize storage
initialize temp variable

traverse array
if current is a vowel, append to temp
otherwise, push temp to storage array
and reset empty string to empty string

get max from storage
return max length
=end
def solve(plaintext)
  arr = plaintext.chars 
  cache = []
  temp = ""

  arr.each do |candidate|
    if %w(a e i o u).include?(candidate)
      temp += candidate
      next
    else
      cache.push(temp)
      temp = ''
    end
  end
  cache
end

p solve('iuuvgheaae')