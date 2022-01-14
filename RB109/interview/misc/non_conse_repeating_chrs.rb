=begin
Given a string as input, find the longest substring that does not have 
any consecutive repeating characters.

p find_longest_substring(‘bookkeeper’) == “eper”
p find_longest_substring(‘leetucebox’) == “etucebox”

generate substrings -> squeeze all -> get length of longest

i: str
o: sub_str

ds: str -> arr of sub_str_arr -> str

algo:

INIT caching array
TRAVERSE a range (starting idx) (each)
  TRAVERSE a range (ending idx) (each)
    PUSH substring into a storage arr
  --
--

TRAVERSE arr of (sub_str) (select)
  'aassdf'.squeeze.eql?(sub_str)
-- max by size
Return this str