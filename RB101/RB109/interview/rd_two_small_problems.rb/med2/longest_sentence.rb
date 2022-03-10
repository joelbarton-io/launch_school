=begin
i: long str input         o: printed longest sentence, and print length of that sentence




'Sentence ender' -> "." "?" "!"

Words: anything that is separated by a space

ds: str -> chr arr -> |MUTATION of chr arr| -> other array, filled with sentences -> str and int

ALGO:

INIT array
SPLIT input string into chrs
UNTIL array of chrs is empty do these:
AS soon as we reach a sentence ender, SLICE from index 0 to curr mutating the array
Once empty -> we have all of our sentences

Count up sentence lengths, print longest sentence and print length of that sentence

=end

def longest_sentence(phrase)
  enders, arr = [".", "?", "!"], phrase.chars
  sentences = []
  until arr.empty? do

    (0..).each do |idx|
      if enders.include?(arr[idx])
        sentences << arr.slice!(0..idx).join
        break
      end
    end
  end

  longest = sentences.max_by(&:size)
  [longest.split(" ").length, longest]
end

input2 = "Four score and seven years ago our fathers brought forth
on this continent a new nation, conceived in liberty, and
dedicated to the proposition that all men are created
equal.

Now we are engaged in a great civil war, testing whether
that nation, or any nation so conceived and so dedicated,
can long endure. We are met on a great battlefield of that
war. We have come to dedicate a portion of that field, as
a final resting place for those who here gave their lives
that that nation might live. It is altogether fitting and
proper that we should do this.

But, in a larger sense, we can not dedicate, we can not
consecrate, we can not hallow this ground. The brave
men, living and dead, who struggled here, have
consecrated it, far above our poor power to add or
detract. The world will little note, nor long remember
what we say here, but it can never forget what they
did here. It is for us the living, rather, to be dedicated
here to the unfinished work which they who fought
here have thus far so nobly advanced. It is rather for
us to be here dedicated to the great task remaining
before us -- that from these honored dead we take
increased devotion to that cause for which they gave
the last full measure of devotion -- that we here highly
resolve that these dead shall not have died in vain
-- that this nation, under God, shall have a new birth
of freedom -- and that government of the people, by
the people, for the people, shall not perish from the
earth."
p longest_sentence(input2)
# Time to completion: 29:00
