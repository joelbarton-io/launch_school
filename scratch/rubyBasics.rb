# a = 7

# def my_increment_by(b)
#   puts b      # expect b = 7 
#   b = a + a   # reassignment, b == 14
#   puts b      # b = 14
# end           # => nil

# my_increment_by(a)
# puts a        # a =7

# a = 7             # immutable a points at memory add with increment_by of 7
# array = [1, 2, 3] # array pointing at obj in memory

# array.each do |b| # method invocation variable a =/= a that's pointing at 7
#   puts b 
#   a += 1
# end

# puts a

# a = 7
# array = [1, 2, 3]

# def my_increment_by(ary)
#   ary.each do |b|
#     a += b
#   end
# end

# my_increment_by(array)
# puts a
# loop do
#   puts 'Just keep printing...'
#   break
# end

# loop do
#   puts 'This is the outer loop.'

#   loop do
#     puts 'This is the inner loop.'
#     break
#   end
#   break
# end

# puts 'This is outside all loops.'

# iterations = 1

# loop do
#   puts "Number of iterations = #{iterations}"
#   break if iterations == 5
#   iterations+=1
# end

# loop do
#   puts 'Should I stop looping?'
#   answer = gets.chomp.downcase
#   break if answer == "yes"
# end

# say_hello = true
# iterations = 0

# while say_hello
#   puts 'Hello!'
#   iterations += 1
#   say_hello = false if iterations == 5
# end

# initialize val to true

# numbers = Array(1..99)
# times = 0

# while times < 5
#   puts numbers.sample
#   times+=1
# end

# numbers = [7, 9, 13, 25, 18]
# count = 0
# until numbers.length == 0
#   puts "here: #{numbers.first}"
#   numbers.shift
# end 
# p numbers 

# until count == numbers.size
#   puts numbers[count]
#   count +=1
# end 

# for i in 1..100
#   next if i.even?
#   puts i
# end

# friends = ['Sarah', 'John', 'Hannah', 'Dave']

# for friend in friends
#   puts "Hi #{friend}"
# end 
# count = 1

# loop do
#   puts "#{count} is odd!" if count.odd?
#   puts "#{count} is even!" if count.even?
#   break if count == 5
#   count += 1
# end

# loop do
#   p number = rand(100)
#   break if number.between?(0, 10)
# end


# [true, false].sample

# puts process_the_loop ? "The loop was processed" : "The loop wasn't processed!"

# loop do
#   puts 'What does 2 + 2 equal?'
#   break puts "correct" if gets.chomp.to_i == 4
#   puts "incorrect" 
# end
# numbers = []
# loop do
#   puts "current array: #{numbers}"
#   puts 'Enter any number:'
#   numbers << gets.chomp.to_i
#   break p numbers if numbers.size == 5
# end

# names = ['Sally', 'Joe', 'Lisa', 'Henry']

# loop do
#   puts names.shift
#   break if names.size == 0
# end

# 5.times do |index|
#   puts index
#   break if index == 2
# end

# number = 0

# until number == 10
#   number += 1
#   next if number.odd?
#   puts number
# end

# number_a = 0
# number_b = 0

# loop do
#   go = [true, false].sample
#   increment_by = rand(2)

#   if go
#     number_a += increment_by
#     puts "number_a incremented by #{increment_by}"
#   else
#     number_b += increment_by
#     puts "number_b incremented by #{increment_by}"
#   end 

#   break p "5 was reached by number_b" if (number_b == 5)
#   break p "5 was reached by number_a" if (number_a == 5)
# end

# number_a = 0
# number_b = 0

# loop do
#   number_a += rand(2)
#   number_b += rand(2)
#   next unless number_a == 15 || number_b == 15

#   puts '15 was reached!'
#   break
# end

# def greeting
#   puts 'Hello!'
# end

# number_of_greetings = 2

# while number_of_greetings > 0
#   greeting
#   number_of_greetings -= 1
# end 
