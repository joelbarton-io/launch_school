number = 42

case number
when 1          then p 'first'
when 10, 20, 30 then p 'second'
when 40..49     then p 'third'
end
=begin
What methods does this case statement use to determine which when clause is executed?

a variety of different implementations of the case equality operator.
Line 4 uses `Integer#===`, line 5 uses `Integer#===`, and line 6 uses `Range#===`
=end
