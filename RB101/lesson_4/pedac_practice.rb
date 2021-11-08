# identify the bones of the problem => what are the minimum requirements to solve one case?
# avoid implementation details
# don't overdo visual aids, just enough to suss out the pattern


# 1 => 2                  sum 2
# 2 => 4 6                sum 10
# 3 => 8 10 12            sum 30
# 4 => 14 16 18 20        sum 68
# 5 => 22 24 26 28 30     sum 130

# difference = 2*(row+1) - 2*(row)
# any given first element is == to 2 + (row# * (row# -1))


# def row_sum(row_number)
#   array = []
#   first = 2 + (row_number * (row_number - 1))
#   last = row_number * (row_number + 1)

#   while first < last
#     array << first
#     first += 2
#   end
#   array.reduce(:+)
# end

# input == number of rows
# input == number of elements in each array

# def generate_master_array(rows)
#   full_array = []
#   count = 1
#   current_value = 2

#   while count <= rows              #  do some operation rows # of times
#     fresh_array = []

#     loop do
#       fresh_array.push(current_value)
#       current_value += 2
#       break full_array.push(fresh_array) if fresh_array.size == count
#     end
#     count += 1
#   end
#   full_array
# end

# operations = {
#   "+" => :+,
#   "-" => :-,
#   "*" => :*,
#   "/" => :/
# }

# puts "operation?"
# user_operation = gets.chomp.downcase

# puts "#{user_operation} of which row"
# row_number = gets.chomp.to_i

# master_array = generate_master_array(row_number)

# p master_array
# puts "#{user_operation} of row #{row_number} is #{master_array.fetch(row_number-1).inject(operations[user_operation])}"


# print [22, 24, 26, 28, 30].inject(:/)

# initial solution inverse
#   input: integer
#   output: integer sum

#   - generate last element in row
#   - initialize empty array
#   - enter loop with a condition
#   - push current into an array
#   - subtract 2 from current down to zero, exit loop
#   - sum array

# def sum_row(row_to_sum)

#   last_in_row = row_to_sum * (row_to_sum + 1)
#   array_to_sum = []

#   while row_to_sum > array_to_sum.size
#     array_to_sum << last_in_row
#     last_in_row -= 2
#   end

#   array_to_sum.inject(:+)
# end

# p sum_row(1)


# loop do
#   puts 'Should I stop looping?'
#   answer = gets.chomp
#   break puts 'breaking loop...' if answer == 'yes'
# end

# say_hello = true
# iterations = 1

# while say_hello
#   puts 'Hello!'
#   iterations += 1
#   say_hello = false if iterations > 5
# end


# numbers = (1...100).to_a
# count = 0
# while count < 5
#   puts numbers.sample
#   count += 1
# end

# numbers = []

# while numbers.size < 5
#   numbers << rand(100)
# end

# puts numbers

# numbers = [7, 9, 13, 25, 18]
# count = numbers.size
# until count == 0
#   puts numbers.fetch(-count)
#   count -= 1
# end


# outputs `i` ONLY if `i` is ODD

# for i in 1..100
#   puts i if i.odd?
# end

# friends = ['Sarah', 'John', 'Hannah', 'Dave']

# for friend in friends
#   puts "Hello, #{friend}!"
# end

# count = 1

# loop do
#   puts count.even? ? "#{count} is even!" : "#{count} is odd!"
#   break if count == 5
#   count += 1
# # end

# loop do
#   number = rand(100)
#   puts number
#   break if number.between?(0, 10)
# end

# process_the_loop = [true, false].sample


# if process_the_loop
#   loop do
#     break puts "The loop was processed" if process_the_loop
#   end
# else
#   puts "The loop wasn't processed!"
# end


# loop do
#   puts 'What does 2 + 2 equal?'
#   answer = gets.chomp.to_i
#   break puts "That's correct!" if answer == 4
#   next puts "Wrong answer. Try again!"
# end

# numbers = []

# loop do
#   puts 'Enter any number:'
#   input = gets.chomp.to_i
#   numbers << input
#   break print numbers if numbers.size == 5
# end

# names = ['Sally', 'Joe', 'Lisa', 'Henry']

# loop do
#   break if names.empty?
#   puts names.delete_at(0)
# end
# print names

# should we escape the loop before printing the break condition?

# 5.times do |index|
#   break if index == 2
#   puts index
#   # ...
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
#   puts number_b, number_a
#   number_a += rand(2)
#   number_b += rand(2)
#   next if number_a < 5 && number_b < 5
#   break puts "5 was reached!"
# end

# def greeting
#   puts 'Hello!'
# end

# number_of_greetings = 2

# while number_of_greetings > 0
#   greeting
#   number_of_greetings -= 1
# end



# fruits = ['apple', 'banana', 'pear']
# transformed_elements = []
# # counter = 0

# fruits.size.times do |index|
#   current_element = fruits[index]
#   transformed_elements << current_element + 's'   # appends transformed string into array
# end

# p transformed_elements.object_id, fruits.object_id


# produce = {
#   'apple' => 'Fruit',
#   'carrot' => 'Vegetable',
#   'pear' => 'Fruit',
#   'broccoli' => 'Vegetable'
# }


# print produce['apple'].class


# def general_select(input_hash, search_value)
#   fruit_keys = input_hash.keys
#   count = 0
#   fruits = {}

#   return input_hash if search_value.empty?

#   until count == fruit_keys.size
#     if input_hash[fruit_keys[count]] == search_value
#       fruits[fruit_keys[count]] = search_value
#     end
#     count += 1
#   end
#   fruits
# end

# def select_fruit(fruit_hash)
#   fruits = fruit_hash.select { |_key, value| value == 'Fruit' }
# end

# puts general_select(produce, "") # => {"apple"=>"Fruit", "pear"=>"Fruit"}

# puts produce


# def by_x(numbers, x)

#   double = []
#   count = 0

#   loop do
#     double << numbers[count] * x
#     count += 1
#     break if count >= numbers.size
#   end
#   double
# end


# array = (1..30).to_a
# doubles = by_x(array, 3)

# p array
# p doubles

# p array.object_id
# p doubles.object_id

# question = 'How many times does a particular character appear in this sentence?'
# p question.object_id
# def select_letter(sentence, character)
#   count = 0
#   just_character = ""
#   until sentence.length == count
#     just_character << sentence[count] if sentence[count] == character
#     count += 1
#   end
#   just_character
# end

# p select_letter(question, "t").object_id

# p question.object_id

# p question.chars