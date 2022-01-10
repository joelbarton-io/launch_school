=begin

goal: remove duplicate words from string

i: string with spaces
o: string free of duplicate values (char groups surrounded by two white spaces)

algo: just chain .split .uniq .join
=end

# def remove_duplicate_words(string)
#   string
#     .split(' ')
#     .uniq
#     .join(' ')
# end

def remove_duplicate_words(string)
  string
    .split(' ')
    .each_with_object({}) do |word, hsh| 
      hsh[word.to_sym] = word 
    end
    .values
    .join(' ')
end

p remove_duplicate_words("alpha beta beta gamma gamma gamma delta alpha beta beta gamma gamma gamma delta")