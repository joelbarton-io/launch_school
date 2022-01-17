=begin

Complete the function scramble(str1, str2) that returns true if a portion of str1 characters can be rearranged to match str2, otherwise returns false.
  
Notes:

Only lower case letters will be used (a-z). No punctuation or digits will be included.
Performance needs to be considered

EXPLICIT 
         -> all LOWER case
         -> no PUNCUTATION
         -> no digits
         -> performance prioritized


i: two string args        o: boolean object

ds: -> str -> arr of subs -> |join and sort sub| -> 


algo: 

SORT target input initially

GENERATE permuations of candidate with the size of the target str

WITH our array of permutations -> compare sorted strings to sorted target string

IF any matches, break early
OTHERWISE, no match? -> return false
=end

def scramble?(candidate, target)
  sorted_targ = target.chars.sort
  enum_cand = candidate.chars.permutation(target.size)
  
  enum_cand.any? do |sub|
    sub.sort == sorted_targ
  end
end
