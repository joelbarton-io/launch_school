

def transpose(matrix)
  empty_array = Array.new(matrix[0].size) {[]}

  (0...matrix[0].size).each do |idx|
    matrix.each {|sub| empty_array[idx] << sub[idx]}
  end
  empty_array
end

p transpose([[1, 2, 3], [4, 5, 6], [7, 8, 9]])