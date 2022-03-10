=begin 

i: 6 numbers  o: text message answer

ds: 6 ints -> 5 to arr / 1 left -> query array with 6th ->text message

algo: 
INIT cache
loop_6 times
  REQUEST int
  STORE first 5 answers in array
  STORE last in separate var
_end
query... two answers
=end

# cache = []

# (1..6).each do |n|
#   answer = gets.chomp
#   cache << answer if n <= 5
#   if n.eql?(6)
#     cache.include?(answer) ? p "The number #{answer} appears in #{cache}." : p "The number #{answer} does not appear in #{cache}." 
#   end
# end


str = 'asdffffdsa'
p str.size
characters = str.chars
substrings = (0...str.size).each_with_object([]) do |idx1, arr|
  (idx1...str.size).each do |idx2|
    arr << characters[idx1..idx2].join
  end
end

p substrings.count
p substrings.uniq.count