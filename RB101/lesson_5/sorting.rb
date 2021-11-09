# Sorting...

# count = 0
# sorted = ['ca', 'cape', 'cap', 'caper', 'c', 'cap'].sort do |a, b|
#   result = (a <=> b)
#   words = ''
#   if result == 1
#     words << '<'
#   elsif result == -1
#     words << '>'
#   else
#     words << '=='
#   end
#   puts "#{a} #{words} #{b} #{result}"

#   a <=> b
# end

# p sorted
# ['arc', 'bat', 'cape', 'ants', 'cap'].sort

# ['ants', 'arc', 'bat', 'cape', 'cap']

# cape <=> cap => 1



# [['a', 'cat', 'b', 'c'], ['b', 2], ['a', 'car', 'd', 3], ['a', 'car', 'd']].sort
# [,['a', 'car', 'd'] , ['a', 'car', 'd', 3], ['a', 'cat', 'b', 'c'], ['b', 2]]

# arr = [[1], [2]]

# arr[0] << [2, 2, 3]

# p arr.flatten

# arr = [{ a: 'ant' }, { b: 'bear' }]
# arr[0][:c] = 'cat'
# arr[0][:j] = 'joel'

# arr[0][arr[1].keys[0]] = arr[1].values[0]
# p arr.unshift

# arr = [['a', ['b']], { b: 'bear', c: 'cat' }, 'cab']


# arr[0][1] = 8
# arr # => [[1, 8], [2]]
# a   # => [1, 8]

# this happens because we are directly modifying in place the object
# variable a and arr[0] point at.

#     I'm still having some issues with these types of questions
#     will return to these concepts later this evening

# EX

# array = [:b, 'banana']
# arr1 = [[:a , 'apple'], array, [:c, 'cucumber']]
# arr2 = arr1.dup
# p arr2[0..].to_h
# p array.object_id
# p array

# EX

# string1 = 'hello'
# string2 = string1.dup
# string2.upcase!
# p string1.object_id, string2.object_id
# p string1, string2

# EX

# arr1 = ["a", "b", "c"]
# arr2 = arr1.dup
# arr2.map! do |char|
#   char.upcase
# end

# p arr1 # => ["a", "b", "c"]
# p arr2 # => ["A", "B", "C"]

# EX

# arr1 = ["a", "b", "c"].freeze
# arr2 = arr1.clone
# arr2 << "d"
# => RuntimeError: can't modify frozen Array

# arr1 = ["a", "b", "c"].freeze
# arr2 = arr1.clone
# arr2 << "d"

# arr2 # => ["a", "b", "c", "d"]
# arr1 # => ["a", "b", "c"]


#     Lesson 5.4 Working with Blocks

#     Example 1

#     Action    Object    Side Effect   Return Value    Used?

# [[1, 2], [3, 4]].each do |arr|
#   puts arr.first
# end
# # 1
# # 3
# # => [[1, 2], [3, 4]]

#     EXAMPLE 2
#     Action      Object      Side Effect     Return Value        Used?
#
# 1   map         out arr     none            transformed self    yes, shown on last line
# 2   puts/first  sub-arr     prints '1'      block returns nil   yes, added to output array
# 3   puts/first  sub-arr     prints '3'      block returns nil   yes, added to output array


# [[1, 2], [3, 4]].map do |arr|
#   puts arr.first
# end
# # 1
# # 3
# # => [nil, nil]

#     EXAMPLE 3

#     Action      Object      Side Effect     Return Value        Used?
#
# 1   map         out arr     none            transformed self    no
# 1-4 puts/first  sub-arr     prints '1'      block returns 1     yes, determines return value of block
# 1-4 puts/first  sub-arr     prints '3'      block returns 3     yes, determines return value of block


# [[1, 2], [3, 4]].map do |arr|
#   puts arr.first
#   arr.first
# end
# # => '1'
# # => '3'
# # => [1, 3]


#     EXAMPLE 4

#     Action      Object      Side Effect     Return Value        Used?
# 1   each Inner  outer arr   none            [[18, 7],[3,12]]    assigned to var my_arr
# 2-7 block exe   arr         none            arr (self)          yes, shows up in return value
# 2   each Outer  arr         none            arr (self)          yes
# 3   conditional boolean     none            truthy              yes, determines inner each block return value
# 4   puts        num         prints num      nil                 no
#
# => '18'
# => '7'
# => '12'
# my_arr = [[18, 7],[3,12]]

# my_arr = [[18, 7], [3, 12]].each do |arr|
#   arr.each do |num|
#     if num > 5
#       puts num
#     end
#   end
# end

# 8 actions:
# 1 assignment
# 2 outer method call
# 3 outer block exe
# 4 inner method call
# 5 inner block exe
# 6 conditional
# 7 comparison
# 8 inner block method call

#     Example 5

# [[1, 2], [3, 4]].map do |arr|
#   arr.map do |num|
#     num * 2
#   end
# end

# outer map returns => [[2,4],[6,8]]
# outer block exe => inner map returns => [2, 4] then [6, 8]
# inner block exe => 2 4 ,,,,, 6 8 (all ints)


# 5 actions:

# 1 outer method call (map)
# 2 outer block exe
# 3 inner method call (map)
# 4 inner block exe
# 5 multiplication

# Action      Object      Side Effect     Return Value        Used?
# .map        outer[]     None            => [[],[]]          not used
# block exe   sub-arr     None            result of...        yes, affects outer map return value
# .map        sub-arr     None            result of *         yes affects inner map output
# inn b exe   num         None            integer             yes affects inner block exe return value
# *           num         None            integer             yes affects arr

#     Example 6

# out = [{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash|
#   hash.all? do |key, value|
#     value[0] == key.to_s
#   end
# end
# puts out
# => [{ :c => "cat" }]

#   actions:
# 1 outer method call (select)
# 2 outer block exe (for .select)
# 3 inner method call (all?)
# 4 inner block exe (for .all?)
# 5 equality operator
# 6 instancemethod .to_s

# Action      Object      Side Effect     Return Value      Used?
# select      array       none            [{ :c => "cat" }] not used
# o bl exe    hashes      none            False             curr hash not selected
# all?        hash        none            T/F               yes, return affects outer block exe
# to_s        symbol      temp change     string of sym     yes, evalu by ==
# ==          strings     none            T/F               yes, determines if all? returns true or false


#     Example 7

# arr = [['1', '8', '11'], ['2', '6', '13'], ['2', '12', '15'], ['1', '8', '9']]

# sorted = arr.sort_by do |sub_arr|
#   sub_arr.map do |num|
#     num.to_i
#   end
# end
# p sorted

# => [["1", "8", "9"], ["1", "8", "11"], ["2", "6", "13"], ["2", "12", "15"]]

#   Actions
# 1 sort_by
# 2 ou bl exe
# 3 map
# 4 in bl exe
# 5 to_i
# 6 <=> ???

# Action        Object      Side Effect   Return Value      Used?
# 1 sort_by     outer arr   none          eventual result   No
# 2 ou bl exe   2 sub_arrs  none          1, -1, 0, nil     Yes, in eventual result order
# 3 map         sub_arr     none          compar sub_arr    Yes, in comparison <=>
# 4 in bl exe   num         none          trans num         Yes, is in map's returned arr
# 5 to_i        string      str => int    integer           num in sub_arr is now typed integer
# 5 <=> ???

# Example 8

[[8, 13, 27], ['apple', 'banana', 'cantaloupe']].map do |arr|
  arr.select do |item|
    if item.to_s.to_i == item    # if it's an integer
      item > 13
    else
      item.size < 6
    end
  end
end
# => [[27], ["apple"]]

#   Actions
# 1 map
# 2 out block exe
# 3 select
# 4 inner block exe
# 5 conditional
# 6 to_s
# 7 to_i
# 8 equality
# 9 comparison >
# 10 conditional
# 11 size
# 12 comparison

# Action            Object      SE    Return Value      Used?
# 1 map             outer arr   none  [[27], ["apple"]] no
# 2 out block exe   inner arrs  none  transformed arrs  yes, added to maps return value
# 3 select          inner arr   none  arr               yes, feeds outer block return
# 4 inner block exe arr item    none  truthy value      yes, selects items that return truthy quality
# 5 conditional     expr        none  boolean           controls flow
# 6 to_s            item val    yes   str item val      yes
# 7 to_i            item val    yes   int item val      yes
# 8 equality        expr        none  boolean           used by if block
# 9 comparison >    ints        none  true/false        yes, feeds inner block return
# 10 conditional    expr        none  boolean           controls flow
# 11 .size          str         none  integer           yes, in comparison
# 12 comparison     string      none  true/false        yes, feeds inner block return


#     Example 9

# [[[1], [2], [3], [4]], [['a'], ['b'], ['c']]].map do |element1|
#   element1.each do |element2|
#     element2.partition do |element3|
#       element3.size > 0
#     end
#   end
# end
# => [[[1], [2], [3], [4]], [["a"], ["b"], ["c"]]]


# Action        Object      SE    Return Value      Used?
# 1 map         nested arr  na    transf arr        no
# 2 o bl exe    element1    na    transf el1        in arr returned from map
# 3 each        element1    na    self              returns self
# 4 i bl exe    element2    na    doesn't matter    each doesn't care about block return
# 5 partition   element2    na    nested self       i dont think so
# 6 in bl exe
# 7 size        element3    na    integer value     yes, in comparison
# 8 comparison  expr        na

#     Example 10

# [[[1, 2], [3, 4]], [5, 6]].map do |arr|
#   arr.map do |el|           # arr: [[1, 2], [3, 4]]
#     if el.to_s.size == 1
#       el + 1
#     else
#       el.map do |n|         # el: [1, 2] n: 1
#         n + 1
#       end
#     end
#   end
# end
# => [[[2, 3], [4, 5]], [6, 7]]

#   Actions       Object      SE    Return Value  Used?
# 1 map           nest arrs   na    [[],[]]       no
# 2 o bl exe      arr         na    mod arr       yes, to map return value
# 3 map           arr         na    mod arr       yes, feeds o bl exe
# 4 in bl exe     el of arr   na    mod el of arr yes feeds map's return value
# 5 cond if
# 6 cond else
# 7 to_s
# 8 size
# 9 map           el          na    mod el        yes
# 10 inin bl exe  n           na    mod n         yes
# 11 ==
# 12 addition


# NEVER MUTATE A COLLECTION WHILE ITERATING
# if you must mutate, create a shallow copy of self
# use shallow copy for iteration object
# and mutate self as needed

# If at first code appears opaque or complex, take the time to break it down step by step.
# If necessary use some sort of systematic approach (such as the tabular method outlined in
# this assignment).
# Figure out what is happening at each step, paying particular attention to:
  # Return value
  # Side effects
# Pay attention to the return values of all statements in your code, especially where implicit
# return values are being relied on.
# Make sure you have a clear understanding of the underlying concepts such as data structure,
# loops, iterative methods and the blocks passed to them (go back over earlier assignments if necessary).
# Be clear about the method implementation of the iterative method(s) being used, especially:
  # What values are passed to the block
  # What the method does with the return value of the block