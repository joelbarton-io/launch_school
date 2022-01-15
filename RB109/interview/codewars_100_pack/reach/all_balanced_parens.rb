=begin
Write a function which makes a list of strings representing all 
of the ways you can balance n pairs of parentheses


i: integer denoting number of pairs '()' == 1, '()()' == 2, etc...
o: list of all possible arrangements where they are balanced

Examples
balanced_parens(0) => [""]
balanced_parens(1) => ["()"]                                         -> 1
balanced_parens(2) => ["()()","(())"]                                -> 2  -> 1
balanced_parens(3) => ["()()()","(())()","()(())","(()())","((()))"] -> 5  -> 3
                                                                     -> 10 -> 5
sdf

algo:
INIT storage
GET all permutations of n-pairs as sub_arrays -> strings
PUSH these into storage
SELECT those permutations which pass our test of valid, balanced pair
  HELPER -> 

Helper
keep track of the count
if count ever dips below 0 -> immediately reject that candidate
if count ends up at 0, then we know that the candidate is balanced and valid, so select it

=end

def balanced_parens(n)
  parens = '()' * n
  arr = parens.chars 
  candidates = []
  arr.permutation(n*2) do |candi| 
    candi = candi.join
    candidates << candi unless candidates.include?(candi)
  end
  candidates.select {|candi| valid_candidate?(candi)}
end

def valid_candidate?(string)
  leng = string.size
  count = 0
  (0...leng).each do |idx|
    return false if count < 0
    case
    when string[idx].eql?('(') then count += 1
    when string[idx].eql?(')') then count -= 1
    end
  end
  true
end
p balanced_parens(5)
# p valid_candidate?(')((()))(')
