# case-insensitive
# ignores all non-alphanumerics
def real_palindrome?(phrase)
  cleaned = phrase.downcase.chars.select do |candidate|
    ('a'..'z').to_a.include?(candidate)
  end.join

  cleaned.eql?(cleaned.reverse)
end

p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true           # (case does not matter)
p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false