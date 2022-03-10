=begin
problem

alphabetize the letters and reverse them and leave the non-alpha characters in the same spot

i: single str
o: sorted and reversed str with non-alphas left alone in positions


prob: we need to sort and reverse alphabetical chrs while leaving other non alphas alone

special = ['/', '.', "'"]  map 

ds: str -> arr -> new_str

algo

traverse arra chars (select)
  identify and store alphabeticals in an array
  
sort and reverse these characters 

traverse original array (map)
  if a chr is alphabetical
    shift in from array of sorted_reversed
  otherwise
    leaave in

['ghgjfks...dsda//yjyds.'] -> 
'sfdfs....gdfgdf'
'...fdsf'
'fsdsdf..'
=end

def method(string)
  specials = ['/', '.']
  alphabet = ('a'..'z').to_a
  arr = string.chars
  
  letters = arr.select do |candidate|
    alphabet.include?(candidate)
  end.sort.reverse
  count=-1
  arr.map do |chr|
    if specials.include?(chr)
      chr
    else
      count+=1
      letters[count]
    end
  end.join
end