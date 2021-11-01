# Q. 1
  # ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

  # p ages.include?("Spot")
  # .has_key?
  # .key?
  # .member?

# Q. 2
  # munsters_description = "The Munsters are creepy in a good way."
  # munsters_description.upcase!.split()

  # p munsters_description[0][0].sub!(/^[A-Z]/) {|f| f.downcase! }
  # p munsters_de
  # .swapcase!
  # p munsters_description

# Q. 3
  # ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
  # additional_ages = { "Marilyn" => 22, "Spot" => 237 }
  # ages.merge!(additional_ages)

  # p ages

# Q. 4
  # advice = "Few things in life are as important as house training your pet dinosaur."
  # advice.split().include?("Dino")

  # # OR advice.match?("Dino")

# Q. 5
  #flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# Q. 6
  # push or shovel

# Q. 7
  # flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

  # flintstones.concat("Dino Happy".split())
  # or
  # flintstones.push("Dino", "Happy")
  # p flintstones

# Q. 8
  # advice = "Few things in life are as important as house training your pet dinosaur."
  # advice.slice!("Few things in life are as important as ")

# Q. 9
  # statement = "The Flintstones Rock!"

  # p statement.downcase.split('').count('t')

  # Better
  # statement.count('t')

# Q. 10

  # apparently .center(spec)
