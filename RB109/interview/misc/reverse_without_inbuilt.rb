=begin
Reverse an array without using the built-in reverse method
=end

# solution 1
def reverse_1(array)
  reversed = []
  until array.empty?
    reversed << array.pop
  end
  reversed
end

# solution 2

def reverse_2(array)
  array.map.with_index do |_, idx|
    array[-idx - 1]
  end
end

# p reverse_2([1, 2, 3])

# solution 3


    