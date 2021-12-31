=begin
problem:
i: non-empty string of lowercase letters
o: array => [minimum_substring, substring's_occurence_in_input]

input_string.length == [min_sub_str.length * some_int]

Example:
"ababab"  =>  ["ab", 3]
"abcde"  =>   ["abcde", 1]

data structure:
array of substrings

algo:

convert input string to array; initialize some variables
traverse letters array, with index

generate all possible substrings

if any substring == another
  check how many duplicates there are
    if duplicate count times substring length == input string length, thats our match,
  otherwise, 
    whole string length times 1 is our match

=end

def f(string)
  letters = string.chars
  sub_strings = []

  letters.each_with_index do |_, idx|
    take = 1
    end_point = letters.length - idx

    until take > end_point do
      sub_strings << letters.slice(idx, take).join
      take += 1
    end
  end
  # subs = dupes(sub_strings)
  # repeat_sub_str_count = sub_strings.count(subs)

  # if (repeat_sub_str_count * subs.size).eql?(letters.size)
  #   return [subs, repeat_sub_str_count]
  # else
  #   return [string, 1]
  # end
  dupes(sub_strings)
end

def dupes(array)
  array.detect {|sub_string| array.count(sub_string) > 1}
end



p f('ababab')