=begin
i: string
o: hash object with 3 entries.  lowercase, uppercase, and neither

neithers: elements that are not latin characters, e.g. symbols, numbers, etc. 
empty string still returns hash object with all the keys and values

compiling all the characters in a string into a hash object
- it makes sense to convert input to array object, so we have access to arr/enum methods


ALGO:
init default hash object, can return this if string is empty
initialize an letters array object

convert to array, splitting input by: ''
traverse array object (use array.each_with_object???)
for non latin characters: increment neither
for latin characters: 
  check the el versus itself uppercased [this doesnt matter, we could use lowercased too]
  based on this increment respective hash entries

return hash object
=end
def letter_case_count(string)
  letters = /[a-zA-Z]/

  string
    .chars
    .each_with_object({ lowercase: 0, uppercase: 0, neither: 0 }) do |chr, hsh|
    if letters.match?(chr)
      hsh[:lowercase] += 1 if chr.downcase.eql?(chr)
      hsh[:uppercase] += 1 if chr.downcase != chr
    else
      hsh[:neither] += 1
    end
  end
end
p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

# time to completion: 15:00.  Messed around in irb a lot with letters