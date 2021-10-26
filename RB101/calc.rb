def prompt(message)
  puts "==> #{message}"
end

def valid_num?(number)
  number.to_i.to_s == number || number.to_f.to_s == number
end

loop do
  int1, int2, operator = '', '', ''
  loop do
    prompt("Enter first number: ")
    int1 = gets.chomp
    break if valid_num?(int1)
    prompt("Hmm... that's not a valid number.  Try again!")
  end
  loop do
    prompt("Enter second number: ")
    int2 = gets.chomp
    break if valid_num?(int2)
    prompt("Hmm... that's not a valid number.  Try again!")
  end
  prompt("What type of operation are we performing? 1) addition 2)
  subtraction 3) multiplication 4) division")
  loop do
    operator = gets.chomp
    break if %w(1 2 3 4).include?(operator)
    prompt("Must be 1, 2, 3, 4")
  end
  result = case operator
           when "1"
             int1.to_i + int2.to_i
           when "2"
             int1.to_i - int2.to_i
           when "3"
             int1.to_i * int2.to_i
           when "4"
             int1.to_f / int2.to_f
           end
  prompt("The result is #{result}")
  prompt("Make another calculation? (Y/y)")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end
