# def solve(text)
#   chains = vowel_substrings(text.chars)
#   chains.max_by(&:size).size
# end

# def vowel_substrings(arr)
#   chains = []
#   (0...arr.size).each do |idx1|
#     (idx1...arr.size).each do |idx2|
#       substr = arr[idx1..idx2]
#       chains << substr.join if substr.all? {|chr| %w(a e i o u).include?(chr)}
#     end
#   end
#   chains
# end

=begin

CONVERT to array
INIT permanent storage

TRAVERSE array
  INIT temp storage
  if curr chr is a vowel, push that chr to temp storage
  if next chr is not a vowel -> push temp storage to permanent storage and clear temp 
end
return longest chain's size
=end  

def solve(text)
  arr = text.chars
  cache = []
  temp = []
  (0...text.size).each do |idx|
    p arr[idx]
    if %w(a e i o u).include?(arr[idx])
      temp << arr[idx]
      cache << temp.join unless %w(a e i o u).include?(arr[idx+1])
      temp.clear
    end
  end
  p cache
end

p solve("codewarriors") == 2
p solve("suoidea") == 3
p solve("iuuvgheaae") == 4
p solve("ultrarevolutionariees") ==3
p solve("strengthlessnesses") == 1
p solve("cuboideonavicuare") == 2
p solve("chrononhotonthuooaos") == 5
p solve("iiihoovaeaaaoougjyaw") == 8