=begin

data-structure: 
this was my main stumbling block.  Initially, I decided I wanted to use a hash object
to store the current element and its consecutive occurences. This forced me to figure out
the logic for when to overwrite a character's value. It doubled the amount of conditional
statements and ended up not even working out for me.  I think it's possible this could be 
remedied if I chose to use strings as keys instead of symbols, but regardless, choosing a 
hash as my cache caused unnecessary headaches.

After mucking with my psuedocode algorithm, it became clear I needed to take a different 
approach. Using an array as a cache led to simpler logic and easier to read code. 

MAIN TAKEAWAY: don't always go with your first thought re: data structures. Also, when returning
to your psuedocode and things still aren't working, it might be time to reassess other pedac
steps.

algo:
- iterate over array with indexes
- curr == next element? -> increment counter, then go next
- curr != next element? -> add current el and counter to storage cache, reset counter

- return element and count with greatest count
=end

def longest_repetition(string)
  return [string, 0] if string.empty?
  arr = string.chars
  cache = []
  count = 1

  arr.each.with_index do |el, idx|
    next count += 1 if el.eql?(arr[idx + 1])
    cache << [el, count]
    count = 1
  end
  cache.max_by { |el| el[1]}
end

p longest_repetition('bbbaaabaaaa')