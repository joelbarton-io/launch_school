# def for_each_in(arr)
#   arr.each { |element| yield element }
# end

# arr = [1, 2, 3, 4, 5]
# results = [0]

# for_each_in(arr) do |number|
#   total = results[-1] + number
#   results.push(total)
#   puts results[-1]
# end

# p results # => [0, 1, 3, 6, 10, 15]

# selfish_proc = Proc.new { p self }

# selfish_proc.call # main

# def proc_caller(proc) # method defined
#   proc.call
# end

# name = 'whatever' # `name` initialized

# a_proc = Proc.new { p name } # proc created
# name = 'something else' # `name` reassigned
# proc_caller(a_proc) # Proc object passed; carries context

#-------------------------------------------------------
# def method_a # implicit
#   yield(3)
#   # block.call(3)
# end

# method_a { |num| puts num**3 }

# def method_b(&block) # converts block to simple Proc
#   # yield(3)
#   block.call(3)
# end

# method_a { |num| puts num**3 }
# method_b { |num| puts num**3 }
#-------------------------------------------------------

# def a_method(param, param2)
#   block_given?
#   # yield(param, param2)
#   # puts param, param2
# end

# p a_method('hi', 'bye') { |a| puts "args: #{a}" }

ARRAY = [1, 2, 3]

def abc
  a = 3
end

def xyz(collection)
  collection.map { |x| yield x }
end

proc = Proc.new { }

p proc.binding
# xyz(ARRAY) do
#   # block body
# end

