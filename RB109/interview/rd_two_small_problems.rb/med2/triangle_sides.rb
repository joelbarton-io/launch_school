=begin








Explicit:
1) all lengths > 0
2) sum of shorter 2 lengths > length of longest
  second condition only applies to isosceles and scalene triangles
  equi-> second condtion doesn't matter, all sides eql


i: 3 integers     o: :equilateral, :isosceles, :scalene, or :invalid returned


ds: store possible return values in an array -> result = [:equilateral, :isosceles, :scalene, :invalid] 
    add inputs to arr

algo:
ADD inputs -> arr
INIT result arr

RETURN invalid if any input eql? 0
RETURn iso if all inputs are the same

SORT input_arr 

COMPARE sum of two smallest sides to largest 
  -> if sum_of_two < largest -> invalid triangle
  -> if sum_of_two > largest -> valid triangle
    -> DETERMINE if scalene or isosceles
    UNIQ?

=end

def triangle(n1, n2, n3)
  result = [:equilateral, :isosceles, :scalene, :invalid]
  sides = [n1, n2, n3]

  return result.last if sides.any?(&:zero?)
  return result.first if n1 == n2 && n2 == n3

  sorted_sides = sides.sort
  return result.last if (sorted_sides[0] + sorted_sides[1]) < sorted_sides.last
  return result[2] if sorted_sides.uniq.eql?(sorted_sides)
  result[1]
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid

# time to completion: 24:00