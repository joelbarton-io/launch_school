

p:
i: string word     => hash object with symbol keys and int values

ds: string -> hsh object

algo: 

INIT empty hash object
CONVERT input to array object
TRAVERSE array of letters
  check if letter is inside of hsh (letter should be symbolized)
    yes? -> increment value of that key
    no? -> POPULATE hsh with symbol letter : 1 as value
  ending traversal
return cache of letters and occurreces
=end

def letter_Count(phrase)
  cache = Hash.new(0)
  arr = phrase.chars
  
  arr.each do |chr|
    if cache.include?(chr.to_sym)
      cache[chr.to_sym] += 1
    else
      cache[chr.to_sym] = 1
    end
  end
  cache
end

p letter_Count("activity") == {"a": 1, "c": 1, "i": 2, "t": 2, "v": 1, "y": 1}
p letter_Count("codewars") == {"a": 1, "c": 1, "d": 1, "e": 1, "o": 1, "r": 1, "s": 1, "w": 1}
p letter_Count("arithmetics") == {"a": 1, "c": 1, "e": 1, "h": 1, "i": 2, "m": 1, "r": 1, "s": 1, "t": 2}
p letter_Count("traveller") == {"a": 1, "e": 2, "l": 2, "r": 2, "t": 1, "v": 1}
p letter_Count("daydreamer") == {"a": 2, "d": 2, "e": 2, "m": 1, "r": 2, "y": 1}

def letter_count(phrase)
  phrase
    .chars
    .each
    .with_object({}) do |chr, cache|
      cache.include?(chr.to_sym) ? cache[chr.to_sym] += 1 : cache[chr.to_sym] = 1
    end
end