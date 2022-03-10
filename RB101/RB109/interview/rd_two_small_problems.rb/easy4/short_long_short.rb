def short_long_short(str1, str2)
  long = [str1, str2].max_by(&:size)
  short = [str1, str2].min_by(&:size)

  short + long + short
end
p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"