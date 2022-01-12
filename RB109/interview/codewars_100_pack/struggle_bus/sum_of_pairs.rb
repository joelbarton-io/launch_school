=begin
Sum of Pairs

Negative numbers and duplicate numbers can and will appear.
There will also be lists tested of lengths upwards of 10,000,000 elements.
Be sure your code doesn't time out.


Given a list of integers and a single sum value, return the first two values 
(parse from the left please) in order of appearance that add up to form the sum.

sum_pairs([11, 3, 7, 5],         10)
#              ^--^      3 + 7 = 10
== [3, 7]

sum_pairs([4, 3, 2, 3, 4],         6)
#          ^-----^         4 + 2 = 6, indices: 0, 2 *
#             ^-----^      3 + 3 = 6, indices: 1, 3
#                ^-----^   2 + 4 = 6, indices: 2, 4
#  * entire pair is earlier, and therefore the correct answer is == [4, 2]

sum_pairs([0, 0, -2, 3], 2)
#  there are no pairs of values that can be added to produce 2.
== None/nil/undefined (Based on the language)

sum_pairs([10, 5, 2, 3, 7, 5],         10)
#              ^-----------^   5 + 5 = 10, indices: 1, 5
#                    ^--^      3 + 7 = 10, indices: 3, 4 *
#  * entire pair is earlier, and therefore is the correct answer
== [3, 7]

i: array of numbers and a target sum            o: a pair of numbers that sum to target; with lowest 'entire pair'

'entire pair' -> the pair's larger indexed element determines a pair's 'entire pair' value

ds: arr -> |iteration| -> array of subs w/ max index (hash object) -> return pair with min index value

algo
OUTER loop (0...end_of_arr) |cur|
  NESTED loop (cur...end_of_arr)
    if a pair sums to our target, get that pair and that pair's larger index
    store this in a hash object
  end
end

From Hash, get key (pair) with minimum value
=end
def helper(numbers, target)
  sum_to_target = []
  (0...numbers.size).each do |idx1|
    (idx1+1...numbers.size).each do |idx2|
      if (numbers[idx1] + numbers[idx2]).eql?(target)
        sum_to_target << [numbers[idx1], numbers[idx2], idx2]
      end
    end
  end
  sum_to_target
end

def sum_pairs(numbers, target)
  sum_to_target = helper(numbers, target)
  return nil if sum_to_target.empty?
  sum_to_target.min_by do |sub_arr|
    sub_arr.last
  end.first(2)
end


l1= [1, 4, 8, 7, 3, 15]
l2= [1, -2, 3, 0, -6, 1]
l3= [20, -13, 40]
l4= [1, 2, 3, 4, 1, 0]
l5= [10, 5, 2, 3, 7, 5]
l6= [4, -2, 3, 3, 4]
l7= [0, 2, 0]
l8= [5, 9, 13, -3]

p sum_pairs(l1, 8) == [1, 7]
p sum_pairs(l2, -6) == [0, -6]
p sum_pairs(l3, -7) == nil
p sum_pairs(l4, 2) == [1, 1]
p sum_pairs(l5, 10) == [3, 7]
p sum_pairs(l6, 8) == [4, 4]
p sum_pairs(l7, 0) == [0, 0]
p sum_pairs(l8, 10) == [13, -3]

# time to completion: 35:00...