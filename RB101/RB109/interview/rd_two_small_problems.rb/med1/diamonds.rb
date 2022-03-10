=begin

BUILD up to middle, then stop
  build one side 
slice front half from start to just before the middle
reverse that sliced portion and append to the end of the actual
then return
=end
def diamond(n)
  star_count = 0
  quarter = []
  (n/2).downto(0) do |space_count|
    spaces = ' ' * space_count
    spaces << ('*' * star_count) + '*'
    star_count += 1
    quarter << spaces 
  end
  p quarter
  # quarter.map! do |line|
  #   line << line.reverse
  # end
  # new_thing = quarter << quarter.slice(0..(n/2)-1).reverse.flatten
  # p new_thing
end

p diamond(9)

#     *
#    ***
#   *****
#  *******
# *********
#  *******
#   *****
#    ***
#     *



