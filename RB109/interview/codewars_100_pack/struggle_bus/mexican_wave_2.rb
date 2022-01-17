=begin

i: lowercase word, or''
o: array of words

GET letter count -> determines the # of words to be included in output
INIT storage arr
INIT alphabet array

ONLY increment counter when we reach a letter
  OTHERWISE, just go to the next index
WHEN storage array size matches letter count -> break out of loop



algo:
GUARD for an empty input string .empty?
INIT alphabet arr and a storage array []
GET letter count -> determines the # of words to be included in our output array

INIT count to zero
LOOP
  if curr el is a letter -> push word with appropriatedly capitalized letter at index count to storage
  if curr is ' ', -> go next, do not increment counter, do not collection 200 dollars
  
  BREAK when storage is full -> length matches letter count

RETURN storage
=end

def wave(text)
  return [] if text.size.eql?(0)
  alphabet = [*'a'..'z', 'A'..'Z']
  cache = []
  array = text.chars
  
  array.each.with_index do |chr, idx|
    if alphabet.include?(chr)
      temp = text.chars 
      temp[idx].upcase!
      cache << temp.join
    end
  end
  cache
end