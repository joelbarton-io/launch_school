=begin
A string is considered to be in title case if each word in the string is either (a) capitalised (that is, only the first letter of the word is in upper case) or (b) considered to be an exception and put entirely into lower case unless it is the first word, which is always capitalised.
Write a function that will convert a string into title case, given an optional list of exceptions (minor words). The list of minor words will be given as a string with each word separated by a space. Your function should ignore the case of the minor words string -- it should behave in the same way even if the case of the minor word string is changed.

pedac: 
i: string to modify, (OPTIONAL) str of minor words        o: new_str with modifications

TITLE CASE (output goal)(a quality of the string) : either capitalized OR an exception

CONSIDERATIONS: 
1. FIRST word in input must always be capitalized
2. EVERY WORD capitalized...
    UNLESS optional argument is present and curr word is included  

ds: str -> arr of words -> new_str

high level: 

CONVERT to array
CONVERT optional to all downcase (str-> array -> downcase all arr)
TRAVERSE said array

  IF indx is 0, capitalize word, go next
  Unless curr word is present in optional -> capitalize as normal
  OTHERwise, curr is present, -> return as lowercase version 
  
RETURN new_str
=end

def title_case(phrase, optional = '')
  phrase_as_array = phrase.split(' ')
  optional_as_arr = optional.split(' ').map {|el| el.downcase}
  
  result = phrase_as_array.map.with_index do |word, idx|
    if idx.zero?
      word.capitalize
    elsif optional_as_arr.include?(word.downcase)
      word.downcase
    else
      word.capitalize
    end
  end.join(' ')
  result
end

p title_case('a clash of KINGS', 'a an the of') == 'A Clash of Kings'
p title_case('THE WIND IN THE WILLOWS', 'The In') == 'The Wind in the Willows'
p title_case('the quick brown fox') == 'The Quick Brown Fox'
