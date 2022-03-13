# prefixes = %w(Listening_Device Text_Analyzer_Sandwich_Code Passing_Parameters_Part_1 Passing_Parameters_Part_2 Passing_Parameters_Part_3 Method_to_Proc Bubble_Sort_with_Blocks)

# prefixes.map! { |word| word.chars.map(&:downcase).join }

# p prefixes
# dir_name = Kernel.__dir__

# system "cd ."

# system "echo 'in root'" # we're in root!

# system "cd #{dir_name}" # changing to the dir where this script lives...

# system "echo 'in' #{dir_name}" # we're in the right directory!

# prefixes.each_with_index do |str, idx|
#   system "touch #{dir_name}/#{idx + 1}_#{str}.rb"
# end

chrs = "
1	Listening Device	Not completed
2	Text Analyzer - Sandwich Code	Not completed
3	Passing Parameters Part 1	Not completed
4	Passing Parameters Part 2	Not completed
5	Passing Parameters Part 3	Not completed
6	Method to Proc	Not completed
7	Bubble Sort with Blocks	Not completed
".downcase!.split(' ')
p chrs

# ALPHABET = ("a".."z").to_a
# new_chr = chrs.select do |candidate|
#   ALPHABET.include?(candidate)
# end
# # p new_chr
