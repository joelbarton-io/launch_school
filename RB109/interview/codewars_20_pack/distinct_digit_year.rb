=begin

i: int year     o: int


input is start year, need to locate the first future year that has dis nct digits

ds: INT -> inc OP -> to_STR-to_ARR-uniq-to_STR compare w original -> Boolean


ALGO:

- INTAKE int
- starting at int 
- INCREMENT integer
- str -> arr -> uniq, and compare with original
-    IF true,then
-             BREAK and return if all distinct
- otherwise, next
- end
=end

def distinct_digit_year(year)
  loop do
    year += 1
    break year if year.to_s.chars.uniq.join.to_i == year # could have just used digits here
  end
  year
end
p distinct_digit_year(1987) == 2013
p distinct_digit_year(2013) == 2014
p distinct_digit_year(2229) == 2301
# time to completion: 12:30, spent an awkward amount of time at the DS stage, but that was helpful in the end. 