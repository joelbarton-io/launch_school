=begin

i: phrase    o: amount of times search text was found in phrase

'OVERLAP' -> ask a question

EX: -> ('aaa', 'aa', false)  => return 1

       ('aaa', 'aa' ) => return 2
ds: str -> array of substrings


if search.size is zero, return 0

high level:

TRAVERSE string
  if chr == search[0]; slice from curr idx, take search.length |if == search| -> push this to array
                    if allow_overlap == true -> increment idx; go next
                    if allow_overlap == false -> dubl

=end

def search_substr( full_text, search_text, allow_overlap = true )
  substrings = []
  idx = 0

  while idx < full_text.size do
    if full_text[idx].eql?(search_text[0])
      substring = full_text[idx, search_text.size]

      if substring.eql?(search_text)
        substrings << substring
        idx += (search_text.size - 1) unless allow_overlap
      end
    end
    idx += 1
  end
  substrings.size
end

p search_substr('aa_bb_cc_dd_bb_e', 'bb') == 2
p search_substr('aaabbbcccc', 'bbb') == 1
p search_substr('aaacccbbbcccc', 'cc') == 5
p search_substr('aaa', 'aa') == 2
p search_substr('aaa', 'aa',false) == 1
p search_substr('aaabbbaaa', 'bb',false) ==  1
p search_substr('a', '') == 0
p search_substr('', 'a') == 0
p search_substr('', '') == 0
p search_substr('', '',false) == 0