# def valid_number?(number_string)
#   number_string.to_i.to_s == number_string && number_string.to_i != 0
# end

# def first_int
#   loop do
#     print ">>Please enter a positive or negative integer: "
#     num = gets.chomp
#     next p "invalid input" if !valid_number?(num) 
#     break num.to_i
#   end
# end 

# def sec_int(x)
#   loop do
#     print ">>Please enter a positive or negative integer: "
#     num = gets.chomp

#     next p "invalid input" if !valid_number?(num)
#     next p "invalid input, only non-zero integers allowed" if num == "0"

#     break num.to_i if (x > 0 && num.to_i < 0) || (x < 0 && num.to_i > 0)
#     next p "Sorry. One integer must be positive, one must be negative."
#   end
# end 


# int_a = first_int
# int_b = sec_int(int_a)
# sum = (int_a + int_b)
# puts ">> #{int_a.to_s} plus #{int_b.to_s} equals #{sum.to_s}"





# # loop do
# #   int_a = nil
# #   int_b = nil

# #   print ">>first integer: "
# #   int_a = gets.chomp
# #   next puts "invalid input" if !valid_number?(int_a)  # if false, ask for first number

# #   #true 
# #   loop do

# #     if valid_number?(int_a) && int_a.to_i > 0 # if valid and positive
# #       print ">>second integer: "
# #       int_b = gets.chomp
# #       break p (int_a/int_b) if valid_number?(int_b) && int_b.to_i < 0

# #     elsif valid_number?(int_a) && int_a < 0
# #       print ">>second integer: "
# #       int_b = gets.chomp
# #       break p (int_a.to_i/int_b.to_i) if valid_number?(int_b) && int_b > 0 
# #     end 
# #     next puts "invalid" if !valid_number?(int_b) || int_b == '0'
# #   end
# # end


