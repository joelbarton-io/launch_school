=begin

i: string object      o: hash object

"a=1, b=2, c=3, d=4"  ->  { :a => 1, :b => 2, :c => 3, :d => 4}

requirements:
  -> 's=2'
  -> :s => 2
  -> to left and right of '=' -> needs to allow for string lengths > 1
  -> key -> symbol, value -> integer

ds: str -> arr -> str -> |conversion op| -> hsh

algo:

SPLIT input string by (', ')
TRAVERSE key-value elements with a hash
  sub_arr = curr split by '='
  GET first and last of curr elem
  CONVERT first to SYM, last to INT
  INIT hash entries with above values
RETURN hash object

=end

def str_to_hash(string)
  arr = string.split(', ')
  output = arr.each.with_object({}) do |elem, hsh|
    sub_arr = elem.split('=')
    hsh[sub_arr.first.to_sym] = sub_arr.last.to_i
  end
  output
end

str_to_hash("a=1, b=2, c=3, d=4")

# time: 18 minutes