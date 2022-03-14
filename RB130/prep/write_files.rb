prefixes = "
Series
Sieve_of_Eratosthenes
Octal
Trinary
Sum_of_Multiples
Anagrams
Point_Mutations
Word_Count
Perfect_Number
Roman_Numerals
".downcase!.split(' ')

dir_name = Kernel.__dir__

prefixes.each_with_index do |str, idx|
  system "touch #{dir_name}/#{idx + 1}_#{str}.rb"
end

