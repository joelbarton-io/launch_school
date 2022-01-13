# def transpose(matrix)
#   new_matrix = []
#   (0...matrix.size).each do |idx|
#     new_matrix << matrix.map {|sub_arr| sub_arr[idx]}
#   end
#   new_matrix
# end

=begin
main_arr length: 1    sub_arr length: 4
output length: 4      sub_arr length: 1

algo:
sub_array_length_times ...
  push the something-indexed element from each sub_arr into new_arr
=end


def transpose(matrix)
  new_matrix = []
  matrix[0].size.times do |idx|
    new_matrix << matrix.map {|sub| sub[idx]}
  end
  new_matrix
end

p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]
