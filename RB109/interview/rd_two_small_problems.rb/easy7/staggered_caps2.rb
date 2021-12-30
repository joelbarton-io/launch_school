=begin


ALGO:
* ignore non latin characters in count
* cannot base operations on indices anymore

split string into chrs
traverse array object with indexes

for even indices, capitalized -> add to result arr
for odd indices, lower -> add to result arr

convert back to string, return

=end
def staggered_case(phrase, alphas_only = true)
  num = 0
  result = []
  phrase.chars.each do |chr|
    case alphas_only
    when true
      if [*'a'..'z', *'A'..'Z'].include?(chr)
        result << chr.upcase if num.even? 
        result << chr.downcase if num.odd?
        num += 1
      else
        result << chr
      end
    when false
      

  end
  result.join
end
p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

# time to completion: 8:00
# has some issues with modifying my previous solution to work for the requirements of this problem.
# 