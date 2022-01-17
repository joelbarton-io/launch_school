# def solve(string)
#   lengths = []
#   temp = ''
#   (0..string.size).each do |idx|

#     if %w(a e i o u).include?(string[idx])
#       temp << string[idx]
#     else
#       lengths << temp.size
#       temp = ''
#     end
#   end
#   lengths.max
# end
# p solve("codewarriors") == 2
# p solve("suoidea") == 3
# p solve("iuuvgheaae") == 4
# p solve("ultrarevolutionariees") == 3
# p solve("strengthlessnesses") == 1
# p solve("cuboideonavicuare") == 2
# p solve("chrononhotonthuooaos") == 5
# p solve("iiihoovaeaaaoougjyaw") == 8



























=begin

Sum all the even Fibonacci numbers that are lower than the given number n (n is not the nth element of Fibonnacci sequence) without including n.

eve_fib(0)==0
eve_fib(33)==10
eve_fib(25997544)==19544084


start with seed values

generate next fibonacci, replace first with second and second with first plus second

add even fibs to sum
go next

break if first plus sum is greater than nth


=end

def eve_fib(nth)
  sum = 0
  seed = [0, 1]
  
  loop do
    sum += seed.first if seed.first.even?
    next_fib = seed.sum
    break if next_fib >= nth
    seed.push(next_fib)
    seed.shift
  end
  p sum
end

# p eve_fib(0)==0
# p eve_fib(33)==10
# p eve_fib(25997544)==19544084
















=begin
given a non-empty string, check if it can be constructed by taking a substring of it and appending multiple copies of the substring together. You may assume the given string consists of lowercase english letters only.

example 1:
input: 'abab'     -> 'a', 'ab', 'aba', 'abab', 'b', 'ba', 'bab', 'a', 'ab', 'b'
output: true
substring 'ab' twice

rules:
  -> input always non-empty
  -> input always lowercase letters only
  
  -> if input length is ever an odd value, immediately we can return false * 
    -> unless the substring is of length 1, then it can be odd length
  
  
  i: str
  o: boolean t/f

  'substrings': small portions of consecutive letters
  
  we need to compare the input string to a constructed appended copy of all possible substrings

  
algo:

GENERATE a list of substrings based on the input string
  -> remove all substrings of length 1 and length (input string)
  
for each substrings
  -> GET the length of the current substring -> store in variable
  -> divide input string length by substring length

  -> based on this quotient, 
    -> multiple out substring * this value
      -> compare this resulting substring to the input
        -> if eql? -> return true
  
  -> if none of these substrings are eql to input string -> return false

ds: str -> list of strings (arr) -> |operations| -> boolean

=end

def get_all_substrings(text)
  substrings_arr = []
  
  (0...text.size).each do |first|
    (start...text.size).each do |last|
      substrings_arr << text[first..last]
  end
  substrings_arr
end

def repeated_substring_pattern(text)
  substrings = get_all_strings(text)
  
  idx = 0
  loop do 
    multiplier = text.size / substrings[idx].size
    
    return true if multiplier * substrings[idx] == text
    break if idx.eql?(substrings.length - 1)
    idx += 1
  end
  false
end

p get_all_substrings('abab')
# repeated_substring_pattern('abab') == true # 2 substrings of 'ab'
# repeated_substring_pattern('aba') == false # none -> odd length
# repeated_substring_pattern('aabaaba') == false # none -> odd length
# repeated_substring_pattern('abaababaab') == true # 2 substrings of 'abaab'
# repeated_substring_pattern('abcabcabcabc') == true # 4 substrings of 'abc'
