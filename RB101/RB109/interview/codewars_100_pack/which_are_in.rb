=begin

- nested context
- no duplicates in final array

i: two arrays, each containing strings
o: lexicographically sorted array `r`

algo:
- traverse over array2 
- for each element, check to see if that element contains a substring that matches any of the elements in a1
  - if word is found in candidate, push word to r
- remove duplicate strings from r and sort r
=end
def in_array(a1, a2)
  r = []
  a2.each do |candidate|
    a1.each do |word|
      r << word if candidate.match?(word)
    end
  end
  r.uniq.sort
end


=begin
V2.
algo:
  - choose those words from a1 that are present in at least one of the a2 elements
-   ^.select     ^target                           ^any?                  ^candidate
=end

def in_array(a1, a2)
  a1.select do |target|
    a2.any? do |candidate|
      candidate.include?(target)
    end
  end.sort
end
a1 = ["arp", "live", "strong"]
a2 = ["lively", "alive", "harp", "sharp", "armstrong"]

in_array(a1, a2)