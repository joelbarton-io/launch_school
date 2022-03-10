=begin
problem:
i: non-empty string of lowercase letters
o: array => [minimum_substring, substring's_occurence_in_input]

input_string.length == [min_sub_str.length * some_int]

Example:
"ababab"  =>  ["ab", 3]
"abcde"  =>   ["abcde", 1]

ds: str -> arr_of_all_substrings (substr, count)

high level:

GENERATE all possible substrings

COMPARE input string to each substring (MAIN OP)
  UNLESS substring is input length, add substring to self, increment count

return array
=end
def get_subs(phrase)
  result = []
  (0...phrase.size).each do |idx1|
    (idx1...phrase.size).each do |idx2|
      result << phrase[idx1..idx2]
    end
  end
  result
end

def f(phrase)
  sub_strings = get_subs(phrase)
  sub_strings.each do |substring|
    count = phrase.size / substring.size
    return [substring, count] if (substring * count) == phrase  
  end
end
p f('asdf') # == ['asdf', 1]