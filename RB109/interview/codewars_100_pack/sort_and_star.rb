=begin

- 'vector of strings' -- unsure what this means... oh just an array

input: list of string objects
algo: 
- sort alphabetically, case-sensitive
- then, return first string, do not remove or add elements to array
- fetch first string, insert stars *** between each letter, return new string
=end
# def two_sort(array_of_strings)
#   sorted_strings = array_of_strings.sort
#   first_to_star = sorted.first
#   first_to_star.chars.join('***')
# end

def two_sort(arr)
  arr
    .sort
    .fetch(0)
    .chars
    .join('***')
end
p two_sort(["bitcoin", "take", "over", "the", "world", "maybe", "who", "knows", "perhaps"])