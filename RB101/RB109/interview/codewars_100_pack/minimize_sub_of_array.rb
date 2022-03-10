=begin
i: arr of ints 

EXPLICIT:
- positives only
- even number of elements

goal: multiply largest by smallest in order to get the minimum sum

- sort numbers by ascii, then multiply extremes, addiing those products to an eventual return value

algo:

SORT by ascending ascii
SLICE off back half, INIT bigs arr
REVERSE bigs
INIT min_sum
TRAVERSE either arr, with indices
  increment min_sum by prod of multiplying els at curr idx
return min_sum

=end

def min_sum(arr)
  sorted = arr.sort
  bigs = sorted.slice!((sorted.size/2), (sorted.size/2))
  bigs.reverse!
  min_sum_total = 0

  sorted.each_with_index do |el, idx|
    min_sum_total += (el * bigs[idx])
  end
  min_sum_total
end
p min_sum([5,4,2,3])
# time to completion: 14:00
