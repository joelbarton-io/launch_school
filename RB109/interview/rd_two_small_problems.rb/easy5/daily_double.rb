# # high level:
# # Until phrase_arr is empty...
# #   if cache[-1]shift the first chr into result cache

def crunch(phrase)
  arr = phrase.chars
  result = [] 
  result << arr.shift
  p result
  until arr.empty? do
    result << arr.shift if result[-1] != (arr.first)
    arr.shift
  end
  p result.join
end
# p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
# p crunch('ggggggggggggggg') == 'g'
# p crunch('a') == 'a'
# p crunch('') == ''

# arr = [1, 2, 3]
# p arr
# until arr.empty? do
#   p arr.pop
# end
# p arr