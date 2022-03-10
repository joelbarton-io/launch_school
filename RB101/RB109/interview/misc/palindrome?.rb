=begin
write a method to determine if a word is a palindrome, 
without using the reverse method
=end

# solution 1
def palindrome_1?(candidate)
  candidate = candidate.chars
  answer = true
  (candidate.size/2).times.with_index do |_, idx|
    answer = false unless candidate[idx] == candidate[-idx - 1]
  end
  answer
end
# solution 2

def palindrome_2(candidate)
  answer = true
  candidate = candidate.chars
  0.upto(candidate.size / 2) do |idx|
    if !(candidate[idx] == candidate[-idx - 1])
      answer = false
    end
  end
  answer
end

