=begin
problem:

i: string of lowercase letters, no spaces
o: longest alphabetical sub_string

MM: only store alphabetical substrings, code needs to be efficient
considerations: input will always be at least one letter long

example: "asdfaaaabbbbcttavvfffffdf" => "aaaabbbbctt"

data structure: definitely an array of substrings

algo:

convert input, init cache and temp
traverse array w index
  if letter and next letter trend alphabetical
    append curr to temp
  else 
    if temp has letters, push temp to cache
      reset temp

get largest from cache and return it
=end
def longest(str)
  array = str.chars
  cache = []
  temp = ''
  array.each.with_index do |chr, idx|
    cache << chr
  end
  cache.join
end

# p longest('asdfaaaabbbbcttavvfffffdf')
