# some methods! 

def prompt(message) puts "=> #{message} " end

def integer?(num) num.to_i.to_s == num end

def float?(num) num.to_f.to_s == num end

def valid_duration?(duration_in_question) integer?(duration_in_question) end

def valid_rate?(rate_in_question) float?(rate_in_question) end

def valid_loan?(loan_in_question)
  integer?(loan_in_question) || float?(loan_in_question)
end

def format_number(num)
  two_decimal_number = num.round(2)
  whole, decimal = two_decimal_number.to_s.split(".")
  num_groups = whole.chars.to_a.reverse.each_slice(3)
  whole_with_commas = num_groups.map(&:join).join(',').reverse
  [whole_with_commas, decimal].compact.join(".")
end

prompt("Welcome to the Mortgage Calculator!")

loop do # main loop
  
  loan_amount, loan_duration, interest_rate  = ''
  
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

  # format

  loan = loan_amount.to_f
  months = loan_duration.to_i * 12
  rate = (interest_rate.to_f / 100) / 12
  
  # calculate mortgage

  mortgage = loan * 
             (rate /
             (1 - (1 + rate)**(-months)))
  
  # humanize nums

  humanized_mortgage = format_number(mortgage)
  
  prompt("MONTHLY: $#{humanized_mortgage}")
  prompt("Calculate another mortgage? (Y/y)")
  do_over = gets.chomp
  
  break prompt("Thank you for using me!  Later!") if do_over.upcase.starts_with?('Y')
  prompt("Ready to calculate another mortgage...")
end
