def halvsies(arr)
  n = (arr.size/2.to_f).ceil
  first_half = arr.shift(n)
  [first_half, arr]
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]