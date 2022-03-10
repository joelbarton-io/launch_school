def balanced?(text)
  parens = text.chars.select do |chr|
    [')', '('].include?(chr)
  end

  if parens.size.odd?
    false
  else
    half = parens.size/2
    return true if parens.slice(0, half).eql?(parens.slice(half..))
    false
  end 
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
