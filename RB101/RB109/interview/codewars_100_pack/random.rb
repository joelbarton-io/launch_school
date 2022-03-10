def kebab(camelcase, case_type = :kebab)
  case_types = {
    kebab: '-',
    longkebab: '<->',
    dollars: '$',
    stars: '*'
  }
  arr = camelcase.chars
  arr.slice_before do |a|
    a.upcase == a
  end.to_a.map {|sub_arr| sub_arr.join }.join(case_types[case_type]).downcase
end


p kebab('camelCaseInput', :stars)
