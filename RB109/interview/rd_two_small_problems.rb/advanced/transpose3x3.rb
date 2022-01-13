def transpose(matrix)
  new_matrix = []
  (0...matrix.size).each do |idx|
    new_matrix << matrix.map {|row| row[idx]}
  end
  new_matrix
end



matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]