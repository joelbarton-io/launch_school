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

prompt("Welcome to the Mortgage Calculator!")
loop do
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

  prompt("An average rate is: 3.081% over 30 years")

  loop do
    prompt("What is your APR (annual percentage rate)?")
    interest_rate = gets.chomp
    break if valid_rate?(interest_rate)
    prompt("Hmm...Invalid entry. Please enter a valid APR:")
  end

  # format numbers for equation
  loan = loan_amount.to_f
  months = loan_duration.to_i * 12
  rate = (interest_rate.to_f / 100) / 12

  # calculation
  mortgage = loan * (rate / (1 - (1 + rate)**(-months)))

  # humanize large numbers
  humanized_loan = loan_amount.chars.to_a.reverse.each_slice(3).map(&:join).join(',').reverse

  prompt("MORTGAGE: $#{mortgage.round(2)}")
  
  prompt("Calculate another mortgage? (Y/y)")
  do_over = gets.chomp

  break prompt("Thank you for using me!  Goodbye!") if do_over.downcase != 'y'
  prompt("Ready to calculate...")
end
