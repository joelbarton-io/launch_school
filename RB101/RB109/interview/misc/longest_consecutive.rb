=begin
You are given an array of strings and an integer k. Your task is to return the first longest string consisting 
of k consecutive strings taken from the array.

Example
longestConsec(["zone", "abigail", "theta", "form", "libe", "zas", "theta", "abigail"], 2)
"abigailtheta"
n being the length of the string array, if n = 0 or k > n or k <= 0 return ""

rules:
  - if arr_leng is 0 -> ''
  - if take_k > arr_leng -> ''
  - if take_k <= 0 -> ''

position of el in array >>>> length of string
  - find longest element
  - get index of that element in original array
  - until the longest_element_index + k is <= input_array.length - 1
    decrement longest element index
    -> this will be the index of the element to cut from to length take_k
=end

def longestConsec(array, count)
  return '' if array.size.zero? || count > array.size || count <= 0
  longest = array.sort_by(&:size).last
  idx_of_longest = (0...array.size).select {|idx| longest.eql?(array[idx])}.join.to_i

  loop do
    if (idx_of_longest + count) < array.size
      return p array.slice(idx_of_longest, count).join
    else
      idx_of_longest -= 1
    end
  end
end
# p longestConsec(["zone", "abigail", "theta", "form", "libe", "zas"], 2) == "abigailtheta"
# p longestConsec(["ejjjjmmtthh", "zxxuueeg", "aanlljrrrxx", "dqqqaaabbb", "oocccffuucccjjjkkkjyyyeehh"], 1) == "oocccffuucccjjjkkkjyyyeehh"
# p longestConsec([], 3) == ""
# p longestConsec(["itvayloxrp","wkppqsztdkmvcuwvereiupccauycnjutlv","vweqilsfytihvrzlaodfixoyxvyuyvgpck"], 2) == "wkppqsztdkmvcuwvereiupccauycnjutlvvweqilsfytihvrzlaodfixoyxvyuyvgpck"
p longestConsec(["wlwsasphmxx","owiaxujylentrklctozmymu","wpgozvxxiu"], 2) == "wlwsasphmxxowiaxujylentrklctozmymu"
# p longestConsec(["zone", "abigail", "theta", "form", "libe", "zas"], -2) == ""
# p longestConsec(["it","wkppv","ixoyx", "3452", "zzzzzzzzzzzz"], 3) == "ixoyx3452zzzzzzzzzzzz"
# p longestConsec(["it","wkppv","ixoyx", "3452", "zzzzzzzzzzzz"], 15) == ""
# p longestConsec(["it","wkppv","ixoyx", "3452", "zzzzzzzzzzzz"], 0) == ""