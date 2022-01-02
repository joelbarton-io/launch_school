def characters(phrase)
  phrase.delete(' ').size
end
p 'Please write word or multiple words: '
p characters(gets.chomp)