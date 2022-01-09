def find_summands(n)
  new_array=[1,3,5]
  until new_array.inject(:+).eql? (n**3)
    new_array=new_array.map{|num| num+=2}
  end
  new_array
end
p find_summands(1).size,1, "incorrect length for n = 1")
p find_summands(1).sum,1, "incorrect sum for n = 1")
p find_summands(3).size,3, "incorrect length for n = 3")
p find_summands(3).sum,27, "incorrect sum for n = 3")
p find_summands(3).all? {|x| x.odd?},true,"Summands must be all odd numbers for n = 3") 