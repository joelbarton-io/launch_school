=begin

i: string containing only letters

considerations:
  -> uppercase letters are UNIQUE
  -> there is only ever one mother, there can be multiple children
  ->
ex:
  -> 'A' - mother, 'a' - child
  input:  "AaaaaZazzz"
  output: "AaaaaaZzzz"
  
ds: str -> arr -> hash {'A'=> 5, 'Z' => 3} -> |ops| -> arr_of_subs -> |op2| -> str

algo:
TRAVERSE input string as array
GENERATE hash object with moms as keys and zeros as values

TRAVERSE input string as array (chars method)
  if a downcased key from our hash matches a letter, increment that key's value by one
  otherwise, go next
END

RENDER hash object as an array of subarrays (mom: child), sort that
JOIN sorted

=end

def find_children(dancing_brigade)
  array = dancing_brigade.chars
  brigade = array.each.with_object({}) do |chr, hsh|
    hsh[chr] = 0 if chr.upcase.eql?(chr)
  end

  array - brigade.keys
  array.each do |letter|
    brigade[letter.upcase] += 1 if brigade.include?(letter.upcase)
  end
  
  brigade = brigade.map do |key, value|
    [key, key.downcase * (value - 1)]  
  end.to_a.sort.join
end
p find_children("abBA") == "AaBb"
p find_children("AaaaaZazzz") == "AaaaaaZzzz"
p find_children("CbcBcbaA") == "AaBbbCcc"
p find_children("xXfuUuuF") == "FfUuuuXx"
p find_children("") == ""