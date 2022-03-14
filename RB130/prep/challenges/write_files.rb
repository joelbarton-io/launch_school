prefixes = "
Triangles
Point_Mutations
Roman_Numerals
Anagrams
Scrabble_Score
Perfect_Number
Octal
Sum_of_Multiples
Beer_Song
Series".downcase!.split(' ')

p prefixes
dir_name = Kernel.__dir__

system "cd ."

system "echo 'in root'" # we're in root!

system "cd #{dir_name}" # changing to the dir where this script lives...

system "echo 'in' #{dir_name}" # we're in the right directory!

prefixes.each_with_index do |str, idx|
  system "touch #{dir_name}/#{idx + 1}_#{str}.rb"
end

