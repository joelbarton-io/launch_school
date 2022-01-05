# n * n
# 4 * 4


# star_count..n 
#   space_count = n - star_count
#   ' ' * space_count + '*' * star_count


def triangle(n, flip = false)
  (1..n).each do |stars|
    case flip
    when false then p " "* (n-stars) + "*" * stars
    when true then p " "* stars + "*" * (n - stars)
    end
  end
end
triangle(15, true)