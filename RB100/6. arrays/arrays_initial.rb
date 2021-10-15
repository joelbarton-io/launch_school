# def squares(input)
#    input.collect do |el|
#     if !el.is_a? Integer
#       el*el
#     else 
#       "#{el.to_s} is not an integer"
#     end
#   end
# end

# newArray = squares([1,2,3,4,5,6,"joel"])

# # puts square_numbers
# # p 5.is_a? Integer 

# def square(input)
#   input.collect {|el| el*el}
# end

# puts square([1,2,3,4,5]) 

# def check_arr(arr, num)
#   arr.include?(num)
# end


# puts check_arr([1, 3, 5, 7, 9, 11], 3)

# [1, 3, 5, 7, 9, 11].each_with_index {
#   |val, idx| puts "#{val} at #{idx}"
# }

def add_two(arr)
  arr.map do |el|
    el += 2
  end
end

initial_arr = [1, 3, 5, 7, 9, 11]
p initial_arr

p add_two(initial_arr)

