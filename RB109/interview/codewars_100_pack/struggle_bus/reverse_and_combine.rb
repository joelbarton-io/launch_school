# def reverse_and_combine_text(text)
#   array = text.split(' ')
#   count_of_init = text.split(' ').size / 2
#   last_el = array.pop if array.size.odd? 

#   count_of_init.times do 
#     temp = []
#     array.map! do |word|
#       word.reverse
#     end
#     until array.empty? do
#       curr = array.slice!(0..1).join
#       temp << curr
#     end
#     array = temp
#   end
#   p array.join.reverse + last_el.reverse
# end



def reverse_and_combine_text(text)
  return array if text.split(' ').size.eql?(1)
  array = text.split(' ')
  reversed = array.map {|word| word.reverse}
  combined = []
  until reversed.empty? do
    combined << reversed.slice!(0..1).join
  end
  combined.join(' ')
  return reverse_and_combine_text(combined)
end

p reverse_and_combine_text("abc def") == "cbafed"
p reverse_and_combine_text("abc def ghi jkl") == "defabcjklghi"
p reverse_and_combine_text("dfghrtcbafed") == "dfghrtcbafed"
p reverse_and_combine_text("234hh54 53455 sdfqwzrt rtteetrt hjhjh lllll12  44") == "trzwqfdstrteettr45hh4325543544hjhjh21lllll"
p reverse_and_combine_text("abc def gh34 434ff 55_eri 123 343") == "43hgff434cbafed343ire_55321"
p reverse_and_combine_text("sdfsdf wee sdffg 342234 ftt") == "gffds432243fdsfdseewttf"
