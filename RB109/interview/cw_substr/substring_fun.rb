=begin

i: array of words
o: new string

example: ["yoda", "best", "has"]  -->  "yes"

data structure: array of strings, string

algorithm:

init empty string
traverse input with indicies
for each word as array, slice letter index based on current index
add these single char strings to emptry string

return empty string output

=end

def nth_char(array)
  return '' if array.empty?
  cache = ''

  array.each_with_index do |word, idx|
    cache << word.chars.slice(idx, 1).join
  end
  cache
end
p nth_char(['yoda', 'best', 'has'])

=begin
optimizations: 
- could reduce code complexity
  + map in place of each
  + dont need to convert word to_a, just use [idx] notation

otherwise, solid and definitely under 15 minutes