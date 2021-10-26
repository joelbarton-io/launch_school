def prompt(message)
  puts "=> #{message} "
end

def integer?(num)
  num.to_i.to_s == num 
end

def float?(num)
  num.to_f.to_s == num
end

def valid_loan?(loan_in_question)
  integer?(loan_in_question) || float?(loan_in_question)
end

def valid_duration?(duration_in_question)
  integer?(duration_in_question)
end

def valid_rate?(rate_in_question)
  float?(rate_in_question)
end

prompt("Welcome to Mortgage Calculator!")

loan_amount = ''
loan_duration = ''
interest_rate = ''

loop do
  prompt("What is your loan amount? $:")
  loan_amount = gets.chomp
  break if valid_loan?(loan_amount)
  prompt("Hmm...Invalid entry. Please re-enter your loan amount:")
end

loop do
  prompt("What is the duration of your loan? # of years:")
  loan_duration = gets.chomp
  break if valid_duration?(loan_duration)
  prompt("Hmm...Invalid entry. Please re-enter your loan duration:")
end
  
loop do
  prompt("An average rate is: 3.081% over 30 years")
  prompt("What is your interest_rate? ")
  interest_rate = gets.chomp
  break if valid_rate?(interest_rate)
  prompt("Hmm...Invalid entry. Please re-enter your interest rate:")
end

loan = loan_amount.to_f
months = loan_duration.to_i
rate = interest_rate.to_f 

# values = [loan, months, rate]

# p values

mortgage = loan * (rate / (1 - (1 + rate)**(-months*12)))

puts mortgage