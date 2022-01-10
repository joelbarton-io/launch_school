=begin
- dont be concerned with white space thank god
- only english alphabet letters

- need to sort alphabetically, case insensitive
    'a', 'A' -> will be considered equivalent in sort algo
algo:

- clean data, remove all non alphas from input string
- sort array, in ascending order
  - convert compared elements to either all upcase or all downcase
- return array.joined
=end

def alphabetized(string)
  alphas_only = ('A'..'Z').to_a + ('a'..'z').to_a
  clean_array = string.chars.select do |el|
    alphas_only.include?(el)
  end
  clean_array.sort { |a, b| a.upcase <=> b.upcase }.join
end