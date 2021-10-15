#loop do
#  puts "Do you want to do that again?"
#  answer = gets.chomp
#  if answer != 'Y'
#    puts "leaving loop"
#    break
#  end
#end
#
#x = gets.chomp.to_i
#
#for i in 1..x do
#  puts x - i
#end
#
#puts "Done!"

#x = 0
#
#while x <= 10
#  puts x if x.odd?
#  x += 1
#end
#def doubler(start)
#  puts start
#  if start < 10
#    doubler(start * 2)
#  end
#end
#
#puts "enter starting value: "
#doubler(gets.chomp.to_i)

# def fibonacci(number)
#   (number < 2) ? number : fibonacci(number-1) + fibonacci(number - 2)
# end

# puts fibonacci(6)

#def fibonacci(number)
#  if number < 2
#    number
#  else
#    fibonacci(number - 1) + fibonacci(number - 2)
#  end
#end
#
#fibonacci(gets.chomp.to_i)

#puts "Enter Command: "
#input = gets.chomp.to_s
#
#while input == "Go"
#  puts "going"
#  input = gets.chomp.to_s
#  break if input == "STOP"
#end
#

#x = ""
#while x != "STOP" do
#  puts "Hi, How are you feeling?"
#  ans = gets.chomp
#  puts "Want me to ask you again?"
#  x = gets.chomp
#end

#def counter(start)
#  if start < 1
#    puts start
#  else
#    return counter(start - 1)
#  end
#end
#
#puts "start countdown at: "
#counter(gets.chomp.to_i)

# def fibonacci(number)
#   if number < 2
#     number
#   else
#     fibonacci(number - 1) + fibonacci(number - 2)
#   end
# end

# puts "nth fibonacci number: "

# number = gets.chomp.to_i
# puts "the #{number}th fibonacci number is:" 
# puts fibonacci(number)

#UNTIL

# until x < 0 
#   puts x
#   x-=1
# end

# puts "Done!"

# DO/WHILE

# loop do
#   puts x
#   x-=1
#   if x == 0
#     puts x
#     break
#   end
# end



#LOOP DO 

# loop do
#   if x >= 0
#     puts x
#     x-=1
#   else
#     break
#   end
# end


# WHILE
# while x >= 0
#   puts x
#   x = x - 1
# end

# puts "Done!"


# print "Type 'Start':"
# x = gets.chomp.to_s

# while x == "Start"
#   puts "running"
#   puts "Stop? >> "
#   stop = gets.chomp.to_s
#   if stop == "Stop"
#     break
#   end
# end

# puts "ended."

def prompt()
  p "enter start value: "
end

def recursive_countdown(start)

  if start == 0 || start.negative?
    if start.negative?
      puts "ERROR: positive integers only"
      prompt()
      recursive_countdown(gets.chomp.to_i)
    else
      puts start
    end

  else
    puts start
    recursive_countdown(start-1)
  end 
end

prompt()

recursive_countdown(gets.chomp.to_i)
