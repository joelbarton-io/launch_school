=begin
  stop generating fibonacci if curr number.to_s.size == input_n

=end
def find_fibonacci_index_by(n)
  seed = [1, 1]
  until seed.last.to_s.size == n do
    seed << (seed[-2] + seed.last)
  end
  seed.size
end


p find_fibonacci_index_by(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by(10) == 45
p find_fibonacci_index_by(100) == 476
p find_fibonacci_index_by(1000) == 4782
p find_fibonacci_index_by(10000) == 47847