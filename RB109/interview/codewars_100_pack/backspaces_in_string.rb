=begin
Assume "#" is like a backspace in string. This means that string "a#bc#d" actually is "bd"

Your task is to process a string with "#" symbols.

Examples
"abc#d##c"      ==>  "ac"
"abc##d######"  ==>  ""
"#######"       ==>  ""
""              ==>  ""

i: str    o: processed string
ds: str -> arr -> |iteration process| -> new_str 

algo:

INIT empty arr []
CONVERT input string -> arr of chrs

TRAVERSE arr_of_chrs
  alphabetical? 
    T? -> push chr into empty, go next
    F? -> pop the last chr off of the holding_letters_arr
  END

RETURN arr as string
=end

def clean_string(string)
  cache = []
  array = string.chars

  array.each do |chr|
    chr.eql?('#') ? cache.pop : cache << chr
  end
  cache.join
end

clean_string('abc#d##c') == "ac" 
clean_string('abc####d##c#') == ""  

# done in 10 minutes