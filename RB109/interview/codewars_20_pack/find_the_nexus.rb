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

def nexus(users)
  updated_value = users.map do |key, value|
    [key, (key - value).abs]
  end
  p updated_value
  updated_value.sort.reverse.min_by(&:last).fetch(0)
end

users = {  1  =>  93,
          10  =>  55,
          15  =>  16,
          20  =>  19,
          23  =>  11,
          30  =>   2 }

p nexus(users)