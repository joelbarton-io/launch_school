# def triple_double(num1, num2)
#   numbers = num1.digits
#   candidates = []
#   (0...numbers.size).each do |start_idx|
#     (start_idx...numbers.size).each do |end_idx|
#       candi = numbers[start_idx..end_idx]
#       candidates << candi if candi.size.eql?(3)
#     end
#   end
#   candidates = candidates.map.select {|trip| trip.uniq.size.eql?(1)}.map(&:join)
#   return 0 if candidates.empty?
#   candidates.any? {|candi| num2.to_s.match?(candi[0...2])} ? 1 : 0
# end
def triple_double(num1,num2)
  candidates = []
  num1.to_s.chars.each_cons(3) {|trio| candidates << trio.join}
  trio_of_cons_repeats = candidates.select {|str| str.squeeze == str}
  # return 0 if trio_of_cons_repeats.empty?
  p trio_of_cons_repeats
  # trio_of_cons_repeats.any? {|trio|num2.to_s.match?(trio[0...2])} ? 1 : 0
end

# p triple_double(451999277, 41177722899) == 1
p triple_double(1222345, 12345) == 0
# p triple_double(12345, 12345) == 0
# p triple_double(666789, 12345667) == 1
# p triple_double(10560002, 100) == 1
# p triple_double(1112, 122) == 0
