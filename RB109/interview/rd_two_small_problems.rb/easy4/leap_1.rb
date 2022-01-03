=begin

not leap -> divisible by 100 UNLESS also divisible by 400
leap -> divisible by 4
=end

def leap_year?(year)
  if (year % 4).zero?
    return true if year % 100 != 0
    return true if (year % 400).zero?
  end
  false
end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == false
p leap_year?(1) == false
p leap_year?(100) == false
p leap_year?(400) == true