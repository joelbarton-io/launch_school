=begin
i: string,  
o: array containing even indexed letters

algo:
- convert to array
- right length?
- traverse array
  - select even-indexed characters
=end
def even_chars(text)
  arr = text.chars
  return 'invalid string' if arr.size > 100 || arr.size < 2

  evens = []
  idx = 0
  until idx.eql?(arr.size)
    evens << arr[idx] if idx.odd?
    idx += 1
  end
  evens
end

def even_chars(text)
  arr = text.chars
  return 'invalid string' if arr.size > 100 || arr.size < 2
  idx = 0
  arr.select { |el| (idx += 1).even? }
end

def even_chars(text)
  return 'invalid string' unless text.length.!!between?(2, 100)
  text
    .chars
    .select
    .with_index(1) { |_, i| i.even? }
end