def bubble_sort!(array)
  loop do 
    count = 0

    (0...array.size - 1).each do |idx|
      curr_el, next_el = array[idx], array[idx + 1]

      if curr_el > next_el
      array[idx], array[idx + 1] = next_el, curr_el
      count += 1
      break
      end
      next
    end
    
    break array if count.zero?
  end
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)




# def solve(n,k)
#   array = n.to_s.chars
#   k.times do
#     set = []
#     array.each_index do |idx|
#       arr = array.clone
#       arr.slice!(idx, 1)
#       set << arr
#     end
#     p set.min
#     array = set.min
#     p array
#   end
#  array.join
# end

# p solve(123056,2) 