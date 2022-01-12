=begin

Problem:
i: single string containing integer characters
o: integer count of the number of odd-numbered substrings

Examples

DS: array of substrings

Algo:
- initialize storage array
- for each character, slice from self to end of array
- push these slices into storage

- iterate over storage
- check if element is odd, if yes, push to result array


=end


def solve(string) 
  substrings = []
  arr = string.chars
  string
    .chars 
    .each
    .with_index do |_, idx|
      
      count = idx
      until count > arr.length do
        substrings.push((arr.slice(idx, count)).join)
        p "ind: #{idx}"
        p "cou: #{count}"
        count += 1
      end
    end
  substrings
end

p solve('1341')

# count = 1
# arr = %w(a b c d e f g h i j k l m n o)
# idx = 1
# until count > arr.length do
#   p arr.slice(idx, count)
#   count += 1
# end