# Q 1.
# i expect a NAME ERROR since greeting is never initialized

      # WRONG!!!

      # normally, my answer is correct.  HOWEVER, when a local
      # variable is initialized within an if/else/while/for/unless/case
      # block (EVEN IF that block is never executed), the ruby parser
      # assigns it the value of nil within its scope
      #

# Q 2.
# line 1: assigning label to hash object
# line 2: instantiating label that references value in greetings object
# line 3: mutating string object referenced by informal_greeting
# line 4:
# line 5: prints informal greeting => 'hi there'
# line 6: prints { a: 'hi there' }

# modify to not mutate:
# greetings = { a: 'hi' }
# informal_greeting = greetings[:a]
# informal_greeting += ' there'

# puts informal_greeting  #  => "hi there"
# puts greetings

# Q 3.

# A)
# 1 three parameters created within method level scope
# 2   reassign p-one = p-two (pointing at 'two') when we see parameter one, it is pointing at the refernce to string object 'one' (line 7)
# 3   reassign p-two = p-three (points at 'three')
# 4
# 5
# 6
# 7 'one'
# 8 'two'
# 9 'three
# 10
# 11 method invoked with references to three string objects
# 12
# 13 this is just method level reassignment, so it should be one, two,  three
# 14 when there's reassignment in a method, new objects are created
# 15


# B)
# 1 three parameters created within method level scope
# 2
# 3
# 4
# 5
# 6
# 7 'one'
# 8 'two'
# 9 'three
# 10
# 11 method invoked with references to three string objects
# 12
# 13
# 14. # one two three
# 15
# def mess_with_vars(one)
#   p one.object_id # same as line 70
#   one = "two"
#   p one.object_id # new object id
# end

# one = "one"
# p one.object_id # object id 1
# # two = "two"
# # three = "three"

# mess_with_vars(one)

# puts "one is: #{one}"
# puts "two is: #{two}"
# puts "three is: #{three}"



# C)
# 1 three parameters created within method level scope
# 2
# 3
# 4
# 5
# 6
# 7 'one'         variable labeled one is pointing at string object 'one'
# 8 'two'
# 9 'three
# 10
# 11 method invoked with references to three string objects
# 12
# 14
# 15 two, three, one

# string = 'asdf'
# p string.object_id # id 1
# string_diff = string
# p string_diff.object_id # id 1

# string_diff.gsub!('asdf', 'lmfao') # modify original object
# p string.object_id # id 1

# def method(string_parameter)
#   p string_parameter.object_id # id 1
#   string_parameter.gsub!('asdf', 'lmfao')
#   p string_parameter.object_id
# end

# p string.object_id

# Q 4.


def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size == 4
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
  end

  true
end

p dot_separated_ip_address?('10.4.5.00')
# i: string of ints and dots
# o: t/f


# generate array of strings breaking up from '.'
# valid var = false

# early condition
  # return valid_var if array.size != 4

