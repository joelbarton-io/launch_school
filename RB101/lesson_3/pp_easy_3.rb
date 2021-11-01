# Q. 1



# Q. 2
  # the problem is type coercion.  the + operator wants to append data of the
  # same type. Instead, it's being forced to try to combine a string object and
  # an integer. There is no implicit conversion.

  # puts "the value of 40 + 2 is " + (40 + 2).to_s
  # puts "the value of 40 + 2 is #{40 + 2}"

# Q. 3
  # def factors(number)
  #   if number <= 0
  #     return "input cannot be lessthan 1"
  #   end

  #   divisor = number
  #   factors = []
  #   loop do
  #     factors << number / divisor if number % divisor == 0
  #     divisor -= 1
  #     break if divisor == 0
  #   end
  #   factors
  # end

  # B1. it checks to see if the result is an integer
  # B2. it returns our array of factors!

# Q. 4
  # yes, there is a difference.
  # the first method mutates and returns the original array
  # the second takes input_array, operates, and returns a new Array object
  # this mostly has to do with the << operator being destructive

    # def rolling_buffer1(buffer, max_buffer_size, new_element)
    #   buffer << new_element
    #   buffer.shift if buffer.size > max_buffer_size
    #   print buffer.object_id
    #   buffer
    # end

    # def rolling_buffer2(input_array, max_buffer_size, new_element)
    #   buffer = input_array + [new_element]
    #   buffer.shift if buffer.size > max_buffer_size
    #   print buffer.object_id
    #   buffer
    # end
    # initial_array = [1,2,3,4,5]
    # p initial_array.object_id
    # p rolling_buffer2(initial_array, 5, 6)

# Q. 5
  # def fib(first_num, second_num, limit)
  #   while first_num + second_num < limit
  #     sum = first_num + second_num
  #     first_num = second_num
  #     second_num = sum
  #   end
  #   sum
  # end

  # result = fib(0, 1, 15)
  # puts "result is #{result}"

# Q. 6
  # 34
  # i should be able to explain why

# Q. 7
  # data is fine, each returns its caller unadulterated (no mutation)
  # WRONG!
    # under the hood, mess_with_demographics is passed the object ID of munsters
    # demo_hash is the method-level variable that points at munsters's object ID
    # if we assign a fresh variable to
# munsters = {
#   "Herman" => { "age" => 32, "gender" => "male" },
#   "Lily" => { "age" => 30, "gender" => "female" },
#   "Grandpa" => { "age" => 402, "gender" => "male" },
#   "Eddie" => { "age" => 10, "gender" => "male" },
#   "Marilyn" => { "age" => 23, "gender" => "female"}
# }

# def mess_with_demographics(demo_hash)
#   p demo_hash.object_id
#   fresh = demo_hash
#   p fresh.object_id

#   fresh.values.each do |family_member|
#     family_member["age"] += 42
#     family_member["gender"] = "other"
#   end
# end

# p munsters.object_id
# p messed = mess_with_demographics(munsters)
# p messed.object_id

# Q. 8
  # paper
  # rock

  # paper, rock -> prints paper

# Q. 9
# return 'no'

# Q. 10

