=begin
right  -> One angle of the triangle is a right angle (90 degrees)
acute  -> All 3 angles of the triangle are less than 90 degrees
obtuse -> One angle is greater than 90 degrees.

the sum of the angles must be exactly 180 degrees, and all angles 
must be greater than 0: if either of these conditions is not satisfied, 
the triangle is invalid.

i: 3 integers 
o: :right, :acute, :obtuse, :invalid

assumtions:
  -> inputs are always integers
  -> specified as degrees

ds: -> push inputs into arr

algo: 

GUARD for any arg of 0; GUARD for sum != 180
  -> :invalid

ANY? angle is eql? to 90 -> right tri
ALL? angles are less than 90 -> acute
ANY? angle > 90 -> obtuse

=end
def triangle(l, w, h)
  angles = [l, w, h]
  case 
  when angles.any?(&:zero?) || angles.sum != 180 then :invalid
  when angles.any? {|ang| ang.eql?(90)}          then :right
  when angles.all? {|ang| ang < 90}              then :acute
  when angles.any? {|ang| ang > 90}              then :obtuse
  end
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid