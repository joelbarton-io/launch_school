=begin
Given a string, return a new string that has transformed based on the input:

Change case of every character, ie. lower case to upper case, upper case to lower case.
Reverse the order of words from the input.
Note: You will have to handle multiple spaces, and leading/trailing spaces.

"Example Input" ==> "iNPUT eXAMPLE"

"  Example    Input"  ==> 'iNPUT   eXAMPLE   '

i: str    o: new_str

req: 
  -> if chr is lowercase; make it uppercase
  -> algo needs to be able to handle multiple spaces and leading/trailing spaces
    -> chars > split : separate chrs by empty space, not whitespace

ds: str -> arr -> |main op| -> |rev op| -> arr -> new_str

algo:

CONVERT input str into an array of characters 
TRAVERSE chr_arr elements (map method)
  Check if alphabetical
    N? -> leave it alone
    Y? -> change it's case to opposite of what it is
  Ended loop -> new arr

REVERSAL? -> going to assume that we don't care about white spaces and 

new_arr -> split by white spaces -> reverse -> join

=end
# def string_transformer(string)
#   string.chars.map do |chr|
#     if [*'a'..'z', 'A'..'Z'].include?(chr)
#       (chr.downcase == chr) ? chr.upcase : chr.downcase
#     else
#       chr
#     end
#   end.join.split(/(\s+)/).reverse.join
# end
def string_transformer(string)
  string.split(/\s/).reverse.map(&:swapcase).join(' ')
end
p string_transformer('  general    Kenobi!  ')
=begin
I think split(/\s/) here is better than split(/\b/). If we are given a string with punctuation,
split(/\b/) will split a trailing punctuation mark like '!' from the end of a word. If we then go
to reverse the words in an array


p string_transformer(" Example     Input")
# 25 minutes /(\s+)/
=end