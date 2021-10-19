# puts "What is your age in years?"
# puts "Age in months: #{gets.to_i * 12}!"

# words = 'car human elephant airplane'



# plurals = words.split(' ').each do |el|
#   el << "s" 
# end 

# p plurals.join(' ')

# p words
# numbers = [5, 9, 21, 26, 39]
# p div_3 = numbers.filter { |num| num%3 == 0}

# ['Dave', 7, 'Miranda', 3, 'Jason', 11]


# car = Hash.new
# car[:type] = 'sedan'
# car[:color] = 'blue'
# car[:mileage] = 80_000


# car.delete(:mileage)
# p car

# numbers = {
#   high:   100,
#   medium: 50,
#   low:    10
# }
# half = numbers.map do | k, v |
#   v/2
# end

# p half

# puts num = numbers.select do |k,v|
#   v < 25
# end 
# Financially, you started the year with a clean slate.



# player = { strength: 10, dexterity: 10, charisma: 10, stamina: 10 }
# character_classes = {
#   warrior: { strength:  20 },
#   thief:   { dexterity: 20 },
#   scout:   { stamina:   20 },
#   mage:    { charisma:  20 }
# }
# puts 'Please type your class (warrior, thief, scout, mage):'
# input = gets.chomp.downcase

# classed_player = player.merge(character_classes[input.to_sym]) #non-destructive solution
# puts 'Your character stats:'
# puts classed_player

# a = 7
# array = [1, 2, 3]

# plus_one =  array.map do |a|
#   a += 1
# end

# p plus_one
