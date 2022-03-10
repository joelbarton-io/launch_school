# i: phrase   o: key: value

# 'word' -> any_str of chrs that does not include a white space ' '

# ds: str -> arr -> |op| -> hash 

def word_sizes(phrase)
  phrase.split(' ').each.with_object({}) do |word, hash|
    hash.has_key?(word.size) ? hash[word.size] += 1 : hash[word.size] = 1
  end
end
p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}