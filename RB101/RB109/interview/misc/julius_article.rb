=begin
Write a method that takes a string argument and returns a new string that contains the value 
of the original string with all consecutive duplicate characters collapsed into a single character

i: str        i: new_str
string    ->    new_str

problem specific requirements:
  -> new_str : means we can convert input to diff datatypes, etc..
  -> 'consecutive'
  -> 'duplicate'
  -> 'collapsed': ex: 'aaabbbcaaaaaaaaa' -> 'abca'

CONSID -> store uniq chrs when we come across them
ds: str -> arr -> |op1| -> arr -> new_str

algo:
INIT empty array object (uniq_cons_chr) STORAGE!
CONVERT input_str -> arr of characters

TRAVERSE arr_of_chrs
  COMPARE curr chr to the last element in storage
    IF eql?, go next
    IF uniq?, push curr into storage
  Loop repeats
Finished

JOIN storage elements -> new_str
=end


def cons_dupes_squeezed(string)
  cache = ''
  string.chars.each do |chr|
    next if cache[-1].eql?(chr)
    cache << chr
  end
  cache
end

p cons_dupes_squeezed('aaabbbcaaaaaaaaa') == 'abca'
p cons_dupes_squeezed('bbbbbbbbb') == 'b'
p cons_dupes_squeezed('wwooonndeerrfull woorrlldd') == 'wonderful world'

# completed in 13 minutes