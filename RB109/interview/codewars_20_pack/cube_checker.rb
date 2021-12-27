# def str_count(word, letter)
#   count = 0
def cube_checker(volume, side)
  return false if volume.zero? || side.zero? || volume < 0 || side < 0
  volume.eql?(side ** 3)
end