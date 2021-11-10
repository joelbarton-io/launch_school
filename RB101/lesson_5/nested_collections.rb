# Practice Problems: Sorting, Nested Collections and Working with Blocks




#     Problem 1   order by numeric value

arr = ['1', '10', '11', '9', '7', '8']

sorted = arr.sort do |a,b|
   b.to_i <=> a.to_i
end 
# p sorted
# p arr

# Action      Object    SideFX  Returned    Used?
# assignment  xxx       none    sorted      no
# sort        arr       none    self        assigned
# block exe   a, b      none    1,-1,0,nil  yes
# to_i        a, b      temp    a/b as int  yes
# <=>         a, b  ...



#     Problem 2   order this array of hashes based on the year of publication of each book, earliest to the latest

books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

sort_by_year = books.sort do |juan, doo|
  juan[:published] <=> doo[:published]
end 

# p sort_by_year



#     Problem 3   reference the letter 'g'

arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
# p arr1[2][1][3]

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
# p arr2[1][:third][0]

arr3 = [['abc'], ['def'], {third: ['ghi']}]
# p arr3[2][:third][0][0]

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
# p hsh1['b'][1]

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
# print hsh2[:third].keys[0]



#     Problem 4    where the value 3 occurs, demonstrate how you would change this to 4.

arr1 = [1, [2, 3], 4]
# p arr1[1][1]= 4

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
# p arr2[2] = 4
# p arr2

hsh1 = {first: [1, 2, [3]]}
# p hsh1[:first][2][0] = 4
# p hsh1

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
# p hsh2[['a']][:a][2] = 4
# p hsh2



#     Problem 5   figure out the total age of just the male members of the family.

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
# ages = []
# munsters.each do |_name, attrib|
#   ages << attrib['age'] if attrib['gender'] == 'male'
# end 
# p ages.inject(&:+)



#     Problem 6   print attributes

# munsters.each do |name, attrib|
#   puts "#{name} is a #{attrib['age']}-year-old #{attrib['gender']}." 
# end 



#     Problem 7   what would be the final values of a and b? Try to work this out without running the code.

a = 2
b = [5, 8]
arr = [a, b]  # => [2, [5, 8]]    a => 2

arr[0] += 2   # => [4, [5, 8]]    a => 4    b => [5, 8]
arr[1][0] -= a # => [4, [1, 8]]   a => 4    b => [1, 8] 



#     Problem 8   Using the each method, write some code to output all of the vowels from the strings.

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

vowels = %w(a e i o u A E I O U)

# hsh.each do |_k, val| 
#   val.each do |el|
#     el.split('').each do |letter|
#       puts letter if vowels.include?(letter)
#     end 
#   end 
# end 

#     issue: I didn't precisely identify the level at which my code was operating on
#            My inner letter parameter was referencing each entire string instead of its componeents
#            so naturally, nothing was being printd to the screen bc fullstrings weren't in vowels



#     Problem 9   Given this data structure, return a new array of the same structure but with 
#                 the sub arrays being ordered (alphabetically or numerically as appropriate) in descending order.

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

# map and sort, class checker to determine sort type 

sort_subarrays = arr.map do |elem|
  elem.sort { |a, b| b <=> a } 
end 

# p sort_subarrays



#     Problem 10  Without modifying the original array, use the map method to return a new array identical 
#                 in structure to the original but where the value of each integer is incremented by 1.


#     array of hashes 

identical = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |hsh|
  hsh.each {|k, v| hsh[k] = v + 1}
end 

# p identical


# i had a lot of issues with this one...        revisit 



#     Problem 11  Using either the select or reject method, return a new array identical in 
#                 structure to the original but containing only the integers that are multiples of 3.

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

div_three = arr.map do |elem|
  elem.select do |int|
    int % 3 == 0
  end 
end 

# p div_three

# Action    Object    SideFX  Returned    Used?
# assign
# map       arr       none    onlydiv3    assigned
# bl exe    elem      none    transf elem added to return array
# select    elem      none    i truthy    feeds transf elem
# in bl exe int       none    t/f -ey     feeds selection



# Problem 12    without using the Array#to_h method, write some code that will return a hash
#               where the key is the first item in each sub array and the value is the second item.
#               

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

hash_dobby = arr.map do |el|
  new_hash = {}
  new_hash[el[0]] = el[1]
  new_hash 
end 
# => [{:a=>1}, {"b"=>"two"}, {"sea"=>{:c=>3}}, {{:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}]



#     Problem 13    return a new array containing the same sub-arrays as the original but 
#                   ordered logically by only taking into consideration the odd numbers they contain. 

# new arr
# same objects

# actions: return new array
arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

ordered = arr.sort_by do |sub_arr|
  sub_arr.select do |el|
    el.odd?
  end 
end 
# p ordered   => [[1, 8, 3], [1, 6, 7], [1, 4, 9]]

#     Problem 14  return an array containing the colors of the fruits and the sizes of the 
#                 vegetables. The sizes should be uppercase and the colors should be capitalized.

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

array = hsh.map do |key, value|
  if value[:type] == 'fruit'
    value[:colors].map do |el|
      el.capitalize
    end 
  elsif value[:type] == 'vegetable'
    value[:size].upcase
  end 
end 

# array = []
# hsh.each do |key, value|
#   array << value[:colors].map {|el| el.capitalize} if value[:type] == 'fruit'
#   array << value[:size].upcase if value[:type] == 'vegetable'
# end



#     Problem 15   return an array which contains only the hashes where all the integers are even

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]


# array = arr.select do |hsh|
#   hsh.all? do |_, value|
#     value.all?(&:even?)
#   end
# end 

# this one was challenging to map out in my head

# my original solution involved iterating over arr with .each and pushing hshs that evaluated to
# truthy to an external array object using a combination of push, all?, and .even?

# my main 

# Action    Object    SideFX  Returned    Used?
# assign    array
# select    arr       none    mod arr     assigned
# o bl exe  hsh       none    t/f         selects hsh that bl exe returns truth-y
# all?      hsh       none    t/f         feeds o bl exe
# i bl exe  value     none    t/f         if true, hsh is selected, false, not selected
# all?      value     none    t/f         yes
# even?     values    none    t/f         yes

# narrative...


#     Problem 16  

# A UUID is a type of identifier often used as a way to uniquely identify items...which may not all be created 
#   by the same system. That is, without any form of synchronization, two or more separate computer systems can create
#   new items and label them with a UUID with no significant chance of stepping on each other's toes.

# It accomplishes this feat through massive randomization. The number of possible UUID values is approximately 3.4 X 10E38.

# Each UUID consists of 32 hexadecimal characters, and is typically broken into 5 sections like this 8-4-4-4-12 and represented as a string.

# It looks like this: "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

# Write a method that returns one UUID when called with no parameters.


# 1 separate subroutine that we can call with a length parameter

HEXIDECIMAL_VALUES = %w(0 1 2 3 4 5 6 7 8 9 a b c d e f)

def generate(n)
  string = ''
  until string.size == n do
    string << HEXIDECIMAL_VALUES.sample
  end
  string 
end 

def generate_UUID ()

  eight = generate(8)
  four_1st = generate(4)
  four_2nd = generate(4)
  four_3rd = generate(4)
  twelve = generate(12)
  
  [eight, four_1st, four_2nd, four_3rd, twelve].join('-')
end 

p generate_UUID