=begin


Example with n = 5 lights:

round 1: every light is turned on
round 2: lights 2 and 4 are now off; 1, 3, 5 are on
round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
round 4: lights 2 and 3 are now off; 1, 4, and 5 are on
round 5: lights 2, 3, and 5 are now off; 1 and 4 are on
The result is that 2 lights are left on, lights 1 and 4. The return value is [1, 4].

With 10 lights, 3 lights are left on: lights 1, 4, and 9. The return value is [1, 4, 9].


all indicies divisible by curr round number
=end

def get_indices(round, n)
  to_flip = []
  first = 1
  until (round * first) > n do 
    to_flip << (round * first) - 1
    first += 1
  end
  to_flip
end

def flip_the_switches(n)
  lights = [true] * n              # round 1
  (2..n).each do |round|           # rounds 2-n
    to_flip = get_indices(round, n)
    lights.map!.with_index do |bulb, idx|
      to_flip.include?(idx) ? !bulb : bulb
    end
  end
  lights
end

def lights(n)
  lights = flip_the_switches(n)
  lights = lights.map.with_index {|bulb, idx| bulb == true ? idx : bulb}
  lights.select {|el| el.is_a?(Integer)}.map {|el| el+1}
end

p lights(1000) #== [true, false, false, true, false, false, false, false, true, false]


