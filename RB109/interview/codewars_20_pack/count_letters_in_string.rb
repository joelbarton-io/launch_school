=begin
PROCESS

i: string word     o: => hash object with symbol keys and int values

ds: string -> ALGO -> hsh object

algo: 
INIT empty hash object
CONVERT input to array object
TRAVERSE array of letters
  check if letter is inside of hsh (letter should be symbolized)
    yes? -> increment value of that key
    no? -> POPULATE hsh with symbol letter : 1 as value
  ending traversal
return hsh of letters and occurreces
=end
def letter_count(phrase)
  phrase
    .chars
    .each
    .with_object({}) do |chr, hsh|
      hsh.include?(chr.to_sym) ? hsh[chr.to_sym] += 1 : hsh[chr.to_sym] = 1
    end
end
