









=begin

i: str      o: boolean

ds: str -> arr_of_chr -> |TRAVERSE arr| -> boolean
  alphabet array
  hash of letter pairs
algo:

INIT alphabet
INIT a key
INIT word_array

TRAVERSE input as arr of characters
  unless curr letter is contained in our alphabet
    go next
  otherwise
    delete two letters from alphabet everytime we see a letter -> KEY which defines letter pairs hsh
    push Curr letter to word array
end

COMPARE constructed word with input word -> boolean return

=end``

def block_word?(candidate)
  candidate_arr = candidate.chars
  result = []
  alphabet = ('A'..'Z').to_a
  clone_alpha = alphabet.clone
  first_half = clone_alpha.slice!(0...13)
  second_half = clone_alpha

  hash_key = (0...13).each_with_object({}) do |idx, hsh|
    hsh[first_half[idx]] = second_half[idx]
    hsh[second_half[idx]] = first_half[idx]
  end


  candidate_arr.each do |chr|
    chr.upcase
    next unless alphabet.include?(chr)

    alphabet.delete(chr)
    alphabet.delete(hash_key[chr])
    result << chr

  end
  result.join.eql?(candidate)
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true