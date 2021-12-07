# require 'pry'

# def include?(arr, search_item)
#   !arr.each { |item| print 'hi' unless item == search_item }
# end

# include?([1, 2, 3, 4, 5], 6)


# def merge(array_1, array_2)
#   array_1 | array_2
# end

# arr1, arr2 = ['hello'], ['hello', 'world']
# merged = merge(arr1, arr2)
# merged[0][0] = 'J'
# p merged[0].object_id
# p arr1[0].object_id
# p arr2[0].object_id

# def fix(value)
#   value.upcase!
#   newval = value.concat('!')
#   binding.pry
#   newval
# end
# s = 'hello'
# p s.object_id
# t = fix(s)

# p s 
# p t


# my_hash = {x: "some value"}
# require 'pry'

# my_hash2 = {}
# loop do 
#   x = "hi there"
#   my_hash2[x] = "some value"
#   binding.pry
# end



# first = 'johnny '

# loop do
# 	last = 'walker'
#   p first + last
#   break
# end

# p first
# p last


# appa_says = 'Huaawnunngg'
# p appa_says.object_id 


# a = 4
# b = 2

# 2.times do |a|
#   # binding.pry
#   a = 5
#   puts a
# end

# puts a
# puts b

# def method param, param2
#   param << param2
#   param
# end

# other = ' there'
# str = 'hi'
# method(str, other)
# p str # => 'hi there'
# p other

def fix(value)
  value = value.upcase!
  value = value.concat('!')
end

s = 'hello'
t = fix(s)

p s
p t
