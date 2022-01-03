CENTURY_OFFSET = 99

def century(year)
  century_num = (year + CENTURY_OFFSET) / 100

  return "#{century_num}th" if [11, 12, 13].include?(century_num % 100)
  last_digit = century_num % 10
  suffix = case last_digit
           when 1 then 'st'
           when 2 then 'nd'
           when 3 then 'rd'
           else 'th'
           end

  "#{century_num}#{suffix}"
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'