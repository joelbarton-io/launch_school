# Soft outline for study plans leading up to interview:

- Establish daily and weekly goals.
- Finish one of my medium articles and publish

1. Redo easy, medium problems, experience full process where appropriate  
2. Reach out to do live, timed coding practice w classmates               |D|
3. Supplement LS supplied problems with Codewars problems 6-4 kyu         |D|
4. Compare my earlier small problems solutions to second pass answers     |_|
5. Flash cards for active recall re: in-build methods, & discuss          |_|
6. At least 2 TA sessions and 2+ SPOT student-led sessions                1 of 4
7. Settle on template ...



+---------------------------------------------------+
| **[00-07]** "read every line SLOWLY"              |
1. state i/o                                        |
2. clarify keywords/concepts                        |
3. look                      |
4. figure out the implicit requirements/r             |
+---------------------------------------------------+
| >>>>> "do I fully UNDERSTAND the question?" <<<<< |
+---------------------------------------------------+
| **[07-14]** "solve every step of logic"           |
1. in -> [steps...] -> out             [data flo]   |
2. sketch all small operations         [high lvl]   |
3. stuck? solve one example manually   [low  lvl]   |
+---------------------------------------------------+
| >>>>>>>>>>>>> "do I have a PLAN?" <<<<<<<<<<<<<<< |
+---------------------------------------------------+
| **[14-21]**                                       |
1. implementation details                           |
2. code with intent                                 |
+---------------------------------------------------+

important: careful with max_by/min_by and max/min !!!

get all consecutive substrings of a list
```ruby
def get_substrings(arr)
  cache = []
  (0...arr.size).each do |start_idx|
    (start_idx...arr.size).each do |end_idx|
      cache << arr[start_idx..end_idx]
    end
  end
  cache
end
```
get all primes upto n
```ruby
def get_primes(n)
  (2...n).select do |prime_candidate|
    (2...prime_candidate).none? {|divisor| (prime_candidate%divisor).zero?}
  end
end
```
get fibonacci sequence upto n
```ruby
def fib_to_(n)
  seed = [0, 1]
  0.upto(n-1) do |idx|
    seed << seed[idx] + seed[idx+1]
  end
  seed
end
```
is it a palindrome?
```ruby
def palindrome?
(str.size/2).times.all? { |i| str[i] == str[-i-1] }
```
are they anagrams?
```ruby
```

future reference written:
-> write out your own questions based on the study guide

for interview:
-> try using binding.pry
-> helper methods?
-> prime, anagram, palindrome, 
