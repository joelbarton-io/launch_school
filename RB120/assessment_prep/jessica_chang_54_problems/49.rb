number = 42

case number
when 1          then 'first'
when 10, 20, 30 then 'second'
when 40..49     then 'third'
end

# What methods does this `case` statement use to determine which `when` clause is executed?

# the above case statement uses Integer#=== and Range#=== equality operators
