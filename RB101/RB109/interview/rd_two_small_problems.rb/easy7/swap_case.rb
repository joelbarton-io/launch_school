=begin

i: string
o: new string with inverted cases

accommodate multi-word string
all non-alpha chrs should remain unchanged

ds: string -> array -> sub_array -> array -> new_string obj

ALGO:

split by whitespace
traverse array
first, check if alpha?
then check case
  based on case of elem, convert to opposing case
return new_string

=end

def swapcase(phrase)
  phrase.chars.map do |chr|
    if [*'a'..'z', *'A'..'Z'].include?(chr) 
      chr.eql?(chr.downcase) ? chr.upcase : chr.downcase
    else
      chr
    end
  end.join
end 

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

# time to completion: went over 15 by a few minutes still under 20,
# had some formatting issues in my chained methods