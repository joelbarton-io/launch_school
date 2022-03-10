=begin

i: string
o: new_string, staggered capitalization scheme

non-latin chrs count in capitalization scheme even though they don't actually change

ds: string -> array of characters -> new_string

ALGO:

split string into chrs
traverse array object with indexes

for even indices, capitalized -> add to result arr
for odd indices, lower -> add to result arr

convert back to string, return

=end

def staggered_case(phrase, start = :even)
  phrase.chars.map.with_index do |chr, idx|
    case start 
    when :even then idx.even? ? chr.upcase : chr.downcase
    when :odd then idx.odd? ? chr.upcase : chr.downcase 
    end
  end.join
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

# time to completion: ~9:30