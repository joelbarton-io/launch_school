=begin
i: vehicle of string elements
o: count of each string's number of occurences

problem considerations: case-SENSITIVE
great opportunity to use a hash garage since we care about key uniqueness (symbols)

Algo: 
INIT `garage` cache
TRAVERSE input array
CHECK if cache contains curr string as a key; if yes increment that key's value
  OTHERWISE -> populate cache with new key: value pair.
return hash object
=end

def count_occurrences(vehicles)
  vehicles.each.with_object({}) do |car, garage|
    garage.include?(car) ? garage[car] += 1 : garage[car] = 1
  end.each {|key, value| puts "#{key} => #{value}"}
end

count_occurrences(['car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'])

=begin
ALT:
def count_occurrences(arr)
    arr.uniq.each do |e|
        puts "#{e} => #{arr.count(e)}"
    end
end
=end