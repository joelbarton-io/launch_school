#exercises 
#1


# "joel" + "barton"


#2


# num = 4321
# thousands = num/1000
# hundreds = num%1000/100
# tens = num%1000%100/10
# ones = num%10
# p ones


#3


# movies = Hash.new
# movies[:the_dark_knight] = 2008
# movies[:interstellar] = 2014
# movies[:dune] = 2021
# movies[:arrival] = 2016
# puts movies.values

#4

# movie_release_dates = movies.values
# movie_release_dates.each {|year| puts year}


#5

# def factorial(x)
#   x < 3 ? x: x * factorial(x-1)
# end 

# num_arr = [5,6,7,8]

# factorialized = num_arr.map do |num|
#    factorial(num)
# end 

# p factorialized
# p num_arr

#6


squared = [3.14, 6.13, 99.006].map do |float|
  float*float
end 
p squared

#7 

