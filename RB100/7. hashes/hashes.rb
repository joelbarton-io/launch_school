# 1


family = {  uncles: ["bob", "joe", "steve"],
  sisters: ["jane", "jill", "beth"],
  brothers: ["frank","rob","david"],
  aunts: ["mary","sally","susan"]
}

# p family[:sisters]
# imm_fam = family.select do |k, v| 
#   k == :sisters || k == :brothers
# end 
# p fin_arr = imm_fam.values.flatten


# 2


# hash_a = { name: "joel", age: 24, height: "5_10" }
# hash_b = { some_friends: ['fields', 'chapin', 'jillian', 'ben']}

# p merged_a_b = hash_a.merge(hash_b)
# puts merged_a_b = hash_a.merge!(hash_b)

# 3

  # family.each {|k,v| puts "#{k} : #{v}"}

# 4

  # person[:name]

# 5

  # p family.has_value?(["jane", "jill", "beth"])

# 6

  # just a difference in syntax used, otherwise they're the same, and  reference the same address in memory.

# 7

  # B