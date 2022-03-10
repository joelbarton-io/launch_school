=begin
o: string with random number between 20-200 interpellated

Algo: output string with sample from range object
=end
def age(name = 'Teddy')
  puts "#{name} is #{[*20..200].sample} years old!"
end
age()
=begin
  - could also use `rand`(range_obj)
=end