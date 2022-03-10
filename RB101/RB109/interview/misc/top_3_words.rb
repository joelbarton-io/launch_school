=begin
# Write a function that, given a string of text (possibly with punctuation and line-breaks), returns an array of the top-3 most occurring words, in descending order of the number of occurrences.

# Assumptions:
# A word is a string of letters (A to Z) optionally containing one or more apostrophes (') in ASCII.
# Apostrophes can appear at the start, middle or end of a word ('abc, abc', 'abc', ab'c are all valid)
# Any other characters (e.g. #, \, / , . ...) are not part of a word and should be treated as whitespace.
# Matches should be case-insensitive, and the words in the result should be lowercased.
# Ties may be broken arbitrarily.
# If a text contains fewer than three unique words, then either the top-2 or top-1 words should be returned, or an empty array if a text contains no words.


EXPLICIT
  -> words are CASE INSENSITIVE
  -> words can have one or more apostrophes but other special characters are not to be counted
  
WORD -> string of letters (potentially including one or more apos)

ds: str phrase -> array of words deleting all non-apostrophes special chars -> clean words arr -> hash -> get max value'd element in hash

algo:

CONVERT phrase -> array

TRAVERSE array of words
  check for and delete all special characters (not including aposphtoes)
NOW we have clean words


TRAVERSE array of clean words-> populating hash object with uniq elements
GET max 3 values
=end

def clean_phrase(dirty_array)
  acceptable = ('a'..'z').to_a << "'"
  cleaned = []
  dirty_array.each do |candidate|
    cleaned << candidate.chars.select {|chr| acceptable.include?(chr) }.join('')
  end
  cleaned.delete('')
  cleaned
end

def top_3_words(phrase)
  phrase.downcase!
  result = []
  return result if phrase.count("a-z").zero?

  alphas_only = ('a'..'z').to_a
  cleaned = clean_phrase(phrase.split(' '))
  
  letter_counts = cleaned.map.with_object(Hash.new(0)) do |word, hsh|
    hsh.include?(word) ? hsh[word] += 1 : hsh[word] = 1
  end

  sorted_by_value = letter_counts.sort_by { |key, value| value }.reverse
  sorted_by_value.each {|pair| result << pair.first }
  result[0...3]
end

p top_3_words("a a a  b  c c  d d d d  e e e e e") ==  ["e", "d", "a"]
p top_3_words("e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e") == ["e", "ddd", "aa"]
p top_3_words("  //wont won't won't ") == ["won't", "wont"]
p top_3_words("  , e   .. ") == ["e"]
p top_3_words("  ...  ") == []
p top_3_words("  '  ") == []
p top_3_words("  '''  ") == []
p top_3_words("""In a village of La Mancha, the name of which I have no desire to call to
mind, there lived not long since one of those gentlemen that keep a lance
in the lance-rack, an old buckler, a lean hack, and a greyhound for
coursing. An olla of rather more beef than mutton, a salad on most
nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra
on Sundays, made away with three-quarters of his income.""") == ["a", "of", "on"]