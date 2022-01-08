=begin
# Given a string of words, you need to find the highest scoring word.

# Each letter of a word scores points according to it's position in the alphabet:
# a = 1, b = 2, c = 3 etc.

# You need to return the highest scoring word as a string.

# If two words score the same, return the word that appears earliest in the original string.

# All letters will be lowercase and all inputs will be valid.

p alphabet_score('man i need a taxi up to ubud') == 'taxi'
p alphabet_score('what time are we climbing up the volcano') == 'volcano'
p alphabet_score('take me to semynak') == 'semynak'
p alphabet_score('aa b') == 'aa'


i: str of words   o: word with highest score

SCORE = sum of letter ordials for that word
EXPLICIT -> if two words have same score, return the one that comes first

ds: -> str -> arr of words -> |OP get word's score| -> push to array of scores -> return word with highest score index

algo: 
  TRAVERSE array of words
  GET SCORE for indiv words ->  helper method
  PUSH scores to score array

  GET max from scores array
  GET index of max score
  RETURN word with that max score index
=end

def word_score(word)
  score = 0
  word.chars.each do |chr|
    score += chr.ord - 96 # thanks jesse!
  end
  score
end

# p word_score('volcano')
# p word_score('climbing')

def alphabet_score(phrase)
  words = phrase.split
  scores = []

  words.each do |word|
    scores << word_score(word)
  end
  p scores
  highest = scores.max
  idx_of_highest = scores.index(highest)
  words[idx_of_highest]
end

p alphabet_score('man i need a taxi up to ubud') == 'taxi'
p alphabet_score('what time are we climbing up the volcano') == 'volcano'
p alphabet_score('take me to semynak') == 'semynak'
p alphabet_score('aa b') == 'aa'

# ('a'..'z').to_a

=begin
# For "x", determine how many positive integers less than or equal to "x" are odd but not prime. Assume "x" is an integer between 1 and 10000.

# Example: 5 has three odd numbers (1,3,5) and only the number 1 is not prime, so the answer is 1
# Example: 10 has five odd numbers (1,3,5,7,9) and only 1 and 9 are not prime, so the answer is 2

# A prime number (or a prime) is a natural number greater than 1 that has no positive divisors other than 1 and itself.

p odd_not_prime(15) == 3
p odd_not_prime(48) == 10
p odd_not_prime(82) == 20

i: int        o: number of odds that are non-prime

prime = positive integer w no divisors other than 1 and self 

ds: 

=end
def odd_not_prime(number)

end