=begin

The input is a string str of digits. Cut the string into chunks (a chunk here is a substring 
of the initial string) of size sz (ignore the last chunk if its size is less than sz).

If a chunk represents an integer such as the sum of the cubes of its digits is divisible by 2, 
reverse that chunk; otherwise rotate it to the left by one position. Put together these modified
chunks and return the result as a string.

EXPLICIT 
-> if sz is <= 0 or if str is empty return ""
-> if sz is greater (>) than str.length return ""

algo:
CONVERT input to array
SLICE input string into chunks of sz.length

STORE chunks in array

TRAVERSE array of chunks
  if chunk == .chars.map(&:to_i).map {|n| n*n*n }.sum is div by 2
    -> reverse chunk
  otherwise,
    rotate chunk to the left by one position rotate method on chunk

Join chunks
=end
def revrot(string_integer, sz)
  return '' if string_integer.size <= 0 || sz > string_integer.size || sz.zero?
  arr = string_integer.chars
  chunks = []
  
  until arr.empty? do 
    chunk = arr.slice!(0...sz)
    chunks << chunk if chunk.size.eql?(sz)
  end
  
  chunks.map do |chk| 
    sum = (chk.map(&:to_i).map {|n| n*n*n }.sum)
    (sum%2).zero? ? chk.reverse : chk.rotate(1)
  end.join
end


# p revrot("123456987654", 6) == "234561876549"
# p revrot("66443875", 4) == "44668753"
# p revrot("66443875", 8) == "64438756"
# p revrot("664438769", 8) == "67834466"
# p revrot("123456779", 8) == "23456771"
# p revrot("", 8) == ""
p revrot("123456779", 0) == "" 
p revrot("563000655734469485", 4) == "0365065073456944"
