=begin
Background
There is a message that is circulating via public media that claims a reader can easily read a message where the inner letters of each words is scrambled, as long as the first and last letters remain the same and the word contains all the letters.

Another example shows that it is quite difficult to read the text where all the letters are reversed rather than scrambled.

In this kata we will make a generator that generates text in a similar pattern, but instead of scrambled or reversed, ours will be sorted alphabetically

Requirement
return a string where:

1) the first and last characters remain in original place for each word
2) characters between the first and last characters must be sorted alphabetically
3) punctuation should remain at the same place as it started, for example: shan't -> sahn't

Assumptions

1) words are seperated by single spaces -> definition of a WORD
2) only spaces separate words, special characters do not, for example: tik-tak -> tai-ktk
3) special characters do not take the position of the non special characters, for example: -dcba -> -dbca **
4) for this kata puctuation is limited to 4 characters: hyphen(-), apostrophe('), comma(,) and period(.)
5) ignore capitalisation

for reference: http://en.wikipedia.org/wiki/Typoglycemia

--------------------------------------------------------------------------------------------

i: str word or str of words        o: modified version of input string

ds: str -> arr of WORDS -> MUTATING for first and last
    
CONSIDERATIONS:
need -> some way to store the index of non first or last special characters

high level

  TRAVERSE array

  NO SPECIAL? -> remove first/last

  word has SPECIAL?
    get all indices + store in variables
    sorting clean string
    adding back specials at appropriate indices

  return string


TRAVERSING array of words
  UNLESS the word has a special characters
  STORE first and last in a first_last_array  -> mutating
  sort the rest of the elements in the mutated array (conv word to array to mutated)
  
  HAS special
    if first chr special
      shift special -> variable
      shift first/last -> variables to be stored
    if last special -> shift into variables to store for later
    *standard sorting happening here
    
    if the special isn't first or last, then...
      GET index of special -> store in variable
      STORE first and last in a first_last_array
      Remove special temp
      
      then -> sort the remaining chr 
      append back first and last chr 
      SPlice in special at it's previous index
=end

def clean(word_chr)
  first_letter = word_chr.shift
  last_letter = word_chr.pop
  sorted_clean = word_chr.sort
  sorted_clean << last_letter
  sorted_clean.prepend(first_letter)
  sorted_clean.join
end

def scramble_words(phrase)
  return '' if phrase.eql?('')
  spec = ['-', ",", "'", "."]
  main_array = phrase.split(' ')
  storage = []

  main_array.each do |word|
    word_chr = word.chars

    unless word_chr.any? {|lett| spec.include?(lett) }
      storage << clean(word_chr)
    else
      special_chr = word_chr.select { |chr| spec.include?(chr) }.join
      special_index = word_chr.index(special_chr)
      word_chr.delete_at(special_index)
      storage << clean(word_chr).insert(special_index, special_chr)
    end
  end
  storage.join(' ')
end

p scramble_words( "come supra-chiasmatic, bliss atonement the supra-chiasmatic. supra-chiasmatic think,")
# p scramble_words('profes-sionals') == "paefil-noorsss"
# p scramble_words('i') == 'i'
# p scramble_words('') == ''
# p scramble_words('me') == 'me'
# p scramble_words('you') == 'you'
# p scramble_words('card-carrying') == 'caac-dinrrryg' # special is present, but not first or last chr
# p scramble_words("shan't") == "sahn't" # special is present, but not first or last chr
# p scramble_words('-dcba') == '-dbca' # ** special is present, and is leading chr
# p scramble_words('dcba.') == 'dbca.' # ** special is present, and is last chr
# p scramble_words("you've gotta dance like there's nobody watching, love like you'll never be hurt, sing like there's nobody listening, and live like it's heaven on earth.") == "you've gotta dacne like teehr's nbdooy wachintg, love like ylo'ul neevr be hrut, sing like teehr's nbdooy leiinnstg, and live like it's haeevn on earth."
