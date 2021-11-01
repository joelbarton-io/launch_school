# Q. 1

# 1 2 2 3
# .uniq sans ! does not alter the caller

# Q. 2

  # 1. NOT equal, variable comparison
  # 2. inverts truthy to falsey or vice versa
  # 3. tells method invocation to mutate its caller in place
  # 4. um probably only in a ternary operator/expression
  # 5. conventional, usually included with methods that return Boolean
  # 6. converts truthy/falsey to True or False

# Q. 3
  # advice = "Few things in life are as important as house training your pet dinosaur."
  # advice_arr = advice.split()
  # advice = advice_arr.map do |el|
  #   el = 'urgent' if el == 'important'
  #   el
  # end
  # puts advice.join

  # # OR
  # advice.gsub!('important', 'urgent')

# Q. 4
  # .delete_at(index) deletes element at specified index
  # .delete(x) deletes x amount of elements starting at index 0 (beginning)

# Q. 5
  # puts (10..100).include?(42)

  # # OR

  # puts (10..100).cover?(42)

# Q.
  # famous_words = "seven years ago..."
  # puts famous_words.prepend('Four score and ')
  # or << or +

# Q. 7

  # flintstones = ["Fred", "Wilma"]
  # flintstones << ["Barney", "Betty"]
  # flintstones << ["BamBam", "Pebbles"]

  # flintstones.flatten!

# Q. 8
  # flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

  # just_barney = flintstones.to_a[2]
  # p just_barney
  # OR flintstones.assoc("Barney")

