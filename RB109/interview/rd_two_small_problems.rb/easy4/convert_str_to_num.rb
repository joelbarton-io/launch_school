def string_to_integer(string)
  dictionary_of_numbers = make_hash()

  make_number(string, dictionary_of_numbers)
end

def make_hash()
  integers, letters = (0..9).to_a, ('0'..'9').to_a
  dictionary_of_numbers = {}

  letters
    .each
    .with_index do |str, idx|
      dictionary_of_numbers[str] = integers[idx]
    end
  dictionary_of_numbers
end

def make_number(string, hash)
  num = 0
  string
    .chars
    .reverse
    .each
    .with_index do |el, idx|
      num += hash[el] * 10**idx 
    end
  num
end
p string_to_integer('123321') == 123321