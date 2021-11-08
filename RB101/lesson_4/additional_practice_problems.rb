# flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

# - turn array to hash where names = keys and indexes = values
# - potentially use each_with_object({}) do |element, hash|

# - perhaps split into to separate arrays, then go from there?
# solution 1

# object = flintstones.each_with_object({}) do |element, hash|
#   hash[element] = flintstones.index(element)
# end

# solution 2
# object = []

# flintstones.each_with_index { |element, index| object.push([element, index]) }
# print object.to_h
# our mistake: i forget what each with index returns, which is self.

# solution 3

# hash = Hash.new

# flintstones.each { |el| hash[el] = flintstones.index(el)}

# puts hash

# Problem 2

# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

# total = ages.values.inject(:+)
# puts total

# total = ages.values
# age_count = 0
# total.each { |el| age_count += el}
# puts age_count
# age = 0
# ages.map { |_k, v| age += v}

# puts age


# Problem 3
# Solution 1

# oldies = ages.delete_if {|_k, v| v >= 100}
# puts ages
# puts ages

# Solution 2

# count = 0
# under_100 = Hash.new
# name_keys = ages.keys
# age_values = ages.values

# while count < ages.size
#   if  ages[name_keys[count]] < 100
#     under_100[name_keys[count]] = age_values[count]
#   end
#   count += 1
# end
# puts under_100
# puts ages


# Problem 4

# make array of values
# make array containing min/max
# access element at index 0
# p ages.values.minmax[0]

# Problem 5

# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# puts flintstones.select { |el| el.slice(0, 2) == "Be" }[0]
# puts flintstones.select { |el| el.slice(0, 2) == "Be"}

# puts flintstones.index { |el| el.slice(0,2) == "Be"}

# print flintstones
# print flintstones.map { |el| el.slice(0,3)}
# print flintstones

# count = 0
# shortened = []

# while count < flintstones.size
#   shortened.push(flintstones[count][0,3])
#   count += 1
# end
# print shortened


# Problem 7
# statement = "The Flintstones Rock"

# Solution 1

# frequency = Hash.new
# arr = statement.downcase.split('')

# arr.each do |el|
#   if frequency.include?(el)
#     frequency[el] += 1
#   else
#     frequency[el] = 1
#   end
# end

# print frequency
# Solution 2

# Problem 8

# numbers = [1, 2, 3, 4]
# numbers.each do |number|
#   p number
#   numbers.shift(1)

#   print numbers
# end

# 1 printed, 1 removed
# 3 printed, 2 removed

# numbers = [1, 2, 3, 4]
# numbers.each do |number|
#   p number
#   numbers.pop(1)
# end

# 1 printed, 4 removed
# 2 printed, 3 removed


# Problem 9
# words = "the flintstones rock"

# new_words = words.split.map { |el| el.capitalize! }.join(" ")

# print new_words

# my issue was forgetting that map returns an entirely new array object.
# when i was trying print what i thought was the modified words, i was really
# just referencing the original string object

# remedied by: assigning new label to what join returns

# Problem 10

#

# munsters = {
#   "Herman" => { "age" => 32, "gender" => "male" },
#   "Lily" => { "age" => 30, "gender" => "female" },
#   "Grandpa" => { "age" => 402, "gender" => "male" },
#   "Eddie" => { "age" => 10, "gender" => "male" },
#   "Marilyn" => { "age" => 23, "gender" => "female"}
# }



# munsters.each do |name, deets|
#   case deets['age']
#   when 0...18
#     deets['age_group'] = 'kid'
#   when 18...65
#     deets['age_group'] = 'adult'
#   else
#     deets['age_group'] = 'senior'
#   end
# end
# add_on = 'age_group'
# categories = %w(kid adult senior)

# munsters.each do |key, value|

#   if munsters[key]['age'] < 18
#     munsters[key][add_on] = categories[0]
#   elsif munsters[key]['age'] >= 18 && munsters[key]['age'] < 64
#     munsters[key][add_on] = categories[1]
#   else
#     munsters[key][add_on] = categories[2]
#   end
# end

# puts munsters


# differences amongst: .each .select .map
  # - .each does not return a new array object, .select and .map do
    # - of the three, select is the only one whose return array's length can be less than that of the calling object length
  #
#

# def integer_to_string(integer)
#   num = (0..9).to_a
#   str = %w(0 1 2 3 4 5 6 7 8 9)
#   as_string = Array.new
#   integer_arr = integer.to_a

#   integer_arr.each do |el|
#     as_string << str[el] if num.include?(el)
#   end
#   as_string.join(',')
# end

# print integer_to_string(1234)

