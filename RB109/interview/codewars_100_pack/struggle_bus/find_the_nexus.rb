# INITIAL:
# def find_nexus(users)
#   m_dim_array = users.to_a
#   diffs = []
  
#   m_dim_array.each do |sub_arr|
#     diffs << (sub_arr.first - sub_arr.last).abs
#   end
#   mutated = m_dim_array.each.with_index do |sub_arr, idx|
#     sub_arr[-1] = diffs.fetch(idx)
#   end
#   mutated.min_by(&:last)[0]
# end

=begin
i: hash object      o: user rank

KEYWORD: nexus= user whose rank is the closest to his honor.
get ab value of (rank - honor) => smallest number means closest to nexus  DIFF
if multiple people have same DIFF, we base on lowest relative rank of user


ds: hash -> array of sub_arr -> |OP1| -> get lowest DIFF(s) 


high-level:

hsh ->array

TRAVERSE this array of subarrays
  GET abs value adding subarray elements together 
  
based on which has smallest diff -> get that rank -> return rank

low-level:

multiple same DIFFS -> get lowest ranked 


=end

# def find_nexus(users)
#   m_dim_array = users.to_a
#   diffs = []
  
#   m_dim_array.each do |sub_arr|
#     diffs << (sub_arr.first - sub_arr.last).abs
#   end
  
#   mutated = m_dim_array.each.with_index do |sub_arr, idx|
#     sub_arr[-1] = diffs.fetch(idx)
#   end
#   mutated.min_by(&:last)[0]
# end


# p find_nexus(users) == 20

# users = {1 => 3, 3 => 3, 5 => 1}
# p find_nexus(users) == 3

# users = {1 => 10, 2 => 6, 3 => 4, 5 => 1}
# p find_nexus(users) == 3

=begin

TRAVERSE hash
  transform key-value pair -> overwrite value to (key-value).absolute value
END -> sort -> min_by last element, get at index 0
def nexus(users)
  users.map do |key, value|
    [key, (key - value).abs]
  end.sort.min_by(&:last).fetch(0)
end

users = {  1  =>  93,
          10  =>  55,
          15  =>  16,
          20  =>  19,
          23  =>  11,
          30  =>   2 }

p nexus(users) == 20
