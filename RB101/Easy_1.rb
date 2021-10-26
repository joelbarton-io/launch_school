#1

def repeat(str, pos_int)
  pos_int.times {puts str}
end 
# repeat("joel", 5)

#2

def odd?(int)
  int%2 == 1
end 

# odd?(3)

#3

# def digit_list(int)
#   int.to_s.split('').map {|el| el.to_i}
# end 

# or
def digit_list(int)
  int.to_s.split('').map(&:to_i)
end 

# p digit_list(12345)

#4

#initialize hash and comp variable
#enter loop with condition: variable == input.length
#check hash to see if it contains input at i
  # yes, increment value of that property
  # no, add input[i]: 1 to hash
# hash

# def count_occ(input)
#   garage = Hash.new
#   i = 0
#   until i == input.length
#     garage.include?(input[i]) ? garage[input[i]] += 1 : garage[input[i]] = 1 
#     i+=1
#   end 
#   garage
# end 

def count_occ(array)
  array.map(&:downcase!)
  garage = Hash.new(0)
  array.each { |el| garage.include?(el) ? garage[el] += 1 : garage[el] = 1}
  garage.each { |k, v| puts "#{k} => #{v}"}
end 

vehicles = [
  'car', 'car', 'truck', 'cAr', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

# count_occ(vehicles)

#5 

def reverse_sentence(string)
  string.split.reverse.join(' ')
end 

# puts reverse_sentence('Hello World') == 'World Hello'
# puts reverse_sentence('Reverse these words') == 'words these Reverse'
# puts reverse_sentence('') == ''
# puts reverse_sentence('    ') == '' # Any number of spaces results in ''

#6

def reverse_words(word)
  word.split.map { |el| el.length >= 5 ? el.reverse : el }.join(' ')
end 

# p reverse_words("Joel Barton Mahoney")

#7 

# def stringy(num, start = 1)
#   out = ""
#   num.times do
#     case start
#     when 1 
#       out.length.even? ? out << "1" : out << "0" 
#     else 
#       !out.length.even? ? out << "1" : out << "0" 
#     end 
#   end˜
#   out
# end

def stringy(num, start = 1)
  out = ""
  num.times do
    case start
    when 1 
      out.length.even? ? out << "1" : out << "0" 
    else 
      out.length.odd? ? out << "1" : out << "0" 
    end 
  end
  out
end

# puts stringy(6, 0) == '010101'
# puts stringy(9) == '101010101'
# puts stringy(4) == '1010'
# puts stringy(7,0) == '1010101'

#8

def average(numbers_array)
  (numbers_array.sum / numbers_array.length).to_f
end 

# puts average([1, 5, 87.3, 45, 8, 8])
# puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
# puts average([1, 5, 87, 45, 8, 8]) == 25
# puts average([9, 47, 23, 95, 16, 52]) == 40

#9

# convert to string (since integers cant be .chars)
# mutate array elements using .map and .to_i
# then, get sum and return
def sum(number)
  number.to_s.chars.map(:to_i).reduce(:+)
end 

# p sum(345)

#10

def calculate_bonus(sal, get_bonus)
  get_bonus ? sal/2 : 0
end 
# puts calculate_bonus(2800, true) == 1400
# puts calculate_bonus(1000, false) == 0
# puts calculate_bonus(50000, true) == 25000

# Quiz question 5: # def string_lengths(sentence)
  # declare numbers array []
  #split sentence into array of words
    # iterate over new array of words
      # numebrs array . push (el.length)
    #return numbers array
    #
  #
#
# def string_lengths(sentence)
#   strings = sentence.split

#   strings.map { |chars| chars.length }
# end

# def string_lengths(sentence)
#   strings = sentence.split
#   lengths = []
#   counter = 1

#   until counter == strings.size do
#     word_length = strings[counter - 1].length
#     lengths.push(word_length)
#     counter += 1
#   end

#   lengths
# end

# p string_lengths('To be or not to be')
