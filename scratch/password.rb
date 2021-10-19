# PASSWORD = "password"
# USERNAME = "username"

# loop do
#   print ">> Please enter your username: "
#   user_attempt = gets.chomp

#   print ">> Please enter your password: "
#   pw_attempt = gets.chomp

#   next puts ">> Invalid username or password!" if (user_attempt != USERNAME || pw_attempt != PASSWORD)
#   break puts "Welcome #{user_attempt}!" if (pw_attempt == PASSWORD && user_attempt == USERNAME)
# end



def valid_number?(number_string)
  number_string.to_i.to_s == number_string
end

def get_numerator()
  print ">> Please enter the numerator: "
  numerator = gets.chomp
end 

def get_denominator()
  print ">> Please enter the denominator: "
  denominator = gets.chomp
end 

numerator = nil
denominator = nil

loop do
  numerator = get_numerator
  next p "invalid input, must be integer" if !valid_number?(numerator)


  denominator = get_denominator
  next p "invalid input, must be integer" if (!valid_number?(denominator) || denominator == '0')
end




# quotient = numerator.to_i/denominator.to_i
# break p ">>#{numerator} / #{denominator} is #{quotient}"
