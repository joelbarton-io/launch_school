# ds: str -> arr -> sum_ords -> return

def ascii_value(phrase)
  phrase.chars.map(&:ord).sum 
end

# OR -> phrase.bytes.sum 
OR -> phrase.sum(&:ord)
OR -> phrase.bytes.inject(0, :+)

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0