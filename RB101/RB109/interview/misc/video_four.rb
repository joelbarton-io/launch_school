=begin

Given 2 strings, your job is to find out if there is a substring that appears in both strings. You will
return true if you find a substring that appears in both strings, or false if you do not. We only care about substrings that are longer than 1 letter long.

i: two strs
o: true or false        => true, if a substring appears in both; false otherwise

goal: find out if there is a shared substring between the inputs.  Substrings of length 1-0 should not be considered

substring: consecutive letter groupings. Ex: 'some', 'som', 'so', etc...

ds: two_strings -> array_of_substrs -> |check| if any are included in our other string

algo:
GUARD for any str inputs that have a length less than 2

CONVERT both input texts to a standardized case

GENERATE a single array of substrings based on str1

REMOVE all substrings with a length less than 2

TRAVERSE sub_str1_arr
  CHECK if any of the substrings match a set characters in string 2
    => true if they do
    => false otherwise
  --
--

=end
def get_substrings(string)
  cache = []
  (0...string.size).each do |start_idx|
    (start_idx...string.size).each do |end_idx|
      cache << string[start_idx...end_idx]
    end
  end
  cache
end

def substring_test(str1, str2)
  return false if [str1, str2].any? {|str| str.size < 2}
  [str1, str2].each(&:downcase!)
  
  str1_substrings_arr = get_substrings(str1)
  str1_substrings_arr.select! {|candidate| candidate.size > 1}
  str1_substrings_arr.each do |candidate|
    return true if str2.match?(candidate)
  end
  false
end

p substring_test('Something', 'Fun') == false
p substring_test('Something', 'Home') == true
p substring_test('Something', '') == false
p substring_test('', 'Something') == false
p substring_test('BANANA', 'banana') == true
p substring_test('test', 'lllt') == false
p substring_test('', '') == false
p substring_test('1234567', '541265') == true
p substring_test('supercalifragilisticexpialidocious', 'SoundOfItIsAtrociou') == true


# time: ~18 minutes
