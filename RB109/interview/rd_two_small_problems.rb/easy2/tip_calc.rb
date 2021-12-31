puts 'What is the bill?'
bill = gets.chomp.to_i
puts 'What is the tip percentage?'
perc = gets.chomp.to_f

tip = (bill*(perc/100)).round(2)
tot = bill + tip

puts "The tip is #{format("%.2f",tip)}"
puts "The total is #{format("%.2f",tot)}"