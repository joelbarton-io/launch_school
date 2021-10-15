# person = {name: 'bob', height: '6 ft', weight: '160 lbs', hair: 'brown'}

# person.each do |key, value|
#   puts "Bob's #{key} is #{value}"
# end

# puts person.fetch(:ruf, "this isn't Germany!")



# array_person = person.to_a

# puts array_person

# family = {  uncles: ["bob", "joe", "steve"],
#             sisters: ["jane", "jill", "beth"],
#             brothers: ["frank","rob","david"],
#             aunts: ["mary","sally","susan"]
#           }

# immediate_family = family.select do |k,v| 
#   k == :brothers || k == :sisters}
# end 

# arr = immediate_family.values.flatten


# hash_a = { name: "joel", age: 24, height: "5ft" }

# hash_b = { college_friends: ['fields', 'chapin', 'jillian']}

# # puts merged_a_b = hash_a.merge(hash_b)
# puts merged_a_b = hash_a.merge!(hash_b)

# puts "#{hash_a} #{hash_b} "

# person_keys = person.each do 
#   |k, v| puts "Key: #{k}, Value: #{v}"
# end 
person = {name: 'Bob', occupation: 'web developer', hobbies: 'painting'} 
# person[:name]


if person.value?("web developer")
  true
else 
  false
end 

