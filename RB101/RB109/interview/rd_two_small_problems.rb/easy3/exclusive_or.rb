def xor?(value1, value2)
  !!value1 ^ !!value2
end

p xor?('true', true)