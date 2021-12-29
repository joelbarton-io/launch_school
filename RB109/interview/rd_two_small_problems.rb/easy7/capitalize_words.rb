=begin
i: single string
o: new string, with all independant words capitalized and their other letters downcased

string -> array -> string

ALGO:

split string by whitespace
traverse array with map
capitalize word -> .capitalize first downcases all elements, then capitalizes chr @ idx 0

=end

def word_cap(string)
  string
    .split(/ /)
    .map do |word|
    word.capitalize  # initially, I chained .downcase & .capitalize capitalize does both
  end.join(' ')
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

# time to completion: just over 7:00