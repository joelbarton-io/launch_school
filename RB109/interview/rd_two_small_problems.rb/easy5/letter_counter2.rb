ALPHABET = [*'a'..'z', *'A'..'Z']

def word_sizes(phrase)
  phrase
    .split(' ')
    .each
    .with_object(Hash.new(0)) do |wrd, hsh|
      cleaned = wrd.chars.select {|chr| ALPHABET.include?(chr)}
      hsh[cleaned.size] += 1
    end
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}