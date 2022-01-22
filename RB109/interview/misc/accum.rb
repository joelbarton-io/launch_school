=begin
i: str
o: new_str

ds: str -> arr of strings -> str 

algo:
INIT cache arr
SPLIT input str by empty space ''
TRAVERSE str_as_arr with indices
  push el * (idx + 1) into cache arr
  FINISH

JOIN cache arr by '-'
=end
def accum(string)
  string.chars.map.with_index do |chr, idx|
    chr * (idx + 1)
  end.map(&:capitalize).join('-')
end

p accum('RqaEzty') == "R-Qq-Aaa-Eeee-Zzzzz-Tttttt-Yyyyyyy"