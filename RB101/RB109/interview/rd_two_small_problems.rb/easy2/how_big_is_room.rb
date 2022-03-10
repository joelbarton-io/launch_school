=begin
PROMPT user for length & width, then display area of room in sq m and sq ft
CALCULATE area in m and ft, display
=end

puts 'Enter the length of the room in meters:'
len = gets.chomp.to_i
puts 'Enter the width of the room in meters:'
wid = gets.chomp.to_i

mete = len * wid
feet = ((len * wid)* 10.7639).round(2)
puts "The area of the room is #{mete} square meters (#{feet} square feet)"