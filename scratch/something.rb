
# loop do 
#   print "print something?  If yes, type [y/n]: " 
#   answer = gets.chomp.downcase
#   break puts "something" if answer == "y"
#   break puts "" if answer == "n"
#   next puts "ERROR! Invalid input! Valid inputs: [y,Y,n,N]"
# end 

#PRINTER

loop do
  print "How many output lines do you want? Enter a number >= 3: (Q to quit)"
  lines = gets.chomp
  break if lines.downcase == 'q'
  next puts "That's not enough lines." if lines.to_i < 3 
  lines.to_i.times {puts "Launch School is the best!"}
end