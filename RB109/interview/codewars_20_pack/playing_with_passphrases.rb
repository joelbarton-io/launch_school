def shift_by_n(str, n)
  alphabet = ('A'..'Z').to_a
  
  shifted_by_n = str.chars.map do |el|
    if alphabet.include?(el)
      index = alphabet.index(el) + n
      index < 26 ? alphabet[index] : alphabet[index - 26]
    else
      el
    end 
  end
  shifted_by_n.join
end

def complementary_digits(str)
  ints = (0..9).to_a.map(&:to_s)
  complementary_digits = str.chars.map do |el|
    ints.include?(el) ? ints[(ints.index(el) - 9).abs] : el
  end
  complementary_digits.join
end

def down(str)
  down_odds = str.chars
  index = 0
  until index.eql?(down_odds.length)
    if index.odd? 
      down_odds[index].downcase!
    end
    index += 1
  end
  down_odds.join
end

def play_pass(str, n)
  shifted_str = shift_by_n(str, n)
  complementary_digits = complementary_digits(shifted_str)
  down_odds = down(complementary_digits)
  down_odds.reverse
end
# p play_pass('BORN IN 2015!', 1)



# def play(str, n)
#   str.tr('A-Z', ('A'..'Z').to_a.rotate(n).join)
# end

# p play('BORN IN 2015!', 1)