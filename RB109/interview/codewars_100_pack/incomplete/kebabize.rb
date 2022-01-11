=begin
Modify the kebabize function so that it converts a camel case string into a kebab case.

kebabize('camelsHaveThreeHumps') // camels-have-three-humps
kebabize('camelsHave3Humps') // camels-have-humps
Notes:

the returned string should only contain lowercase letters

i: camelCase string      o: kebab-case string

algo:

as soon as we reach a capitalized letter, slice out from idx 1 to index curr -1

TRAVERSE array of letters
  Once we reach a capital letter, slice out from 
=end

def kebabize(camelcase_text)
  cleaned = camelcase_text.chars.select {|chr| [*'a'..'z', *'A'..'Z'].include?(chr)}
  capitals = cleaned.select {|chr| chr.upcase.eql?(chr)}
  cap_count = capitals.size

  return cleaned.join if cleaned.size.eql?(1)
  
  cap_count.times do 
    cleaned.insert(cleaned.index(capitals.first), '-')
    cleaned[cleaned.index(capitals.first)].downcase!
    capitals.shift
  end
  cleaned.shift if cleaned.first.eql?('-')
  cleaned.join
end

p kebabize('myCamelCasedString') == 'my-camel-cased-string'
p kebabize('myCamelHas3Humps') == 'my-camel-has-humps'