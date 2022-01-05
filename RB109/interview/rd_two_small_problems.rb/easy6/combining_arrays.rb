def merge(arr, arr2)
  until arr2.empty? do
    arr.include?(arr2.first) ? arr2.shift : arr << arr2.shift
  end
  arr
end

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
# p ([1, 3, 5] + [3, 6, 9]).uniq