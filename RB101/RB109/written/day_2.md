Example 6
```ruby
arr = [1, 2, 3, 4]
counter = 0
sum = 0

loop do
  sum += arr[counter]
  counter += 1
  break if counter == arr.size
end 

puts "Your total is #{sum}"
```
The main concept demonstrated here is **local variable scope** as it pertains to method invocations with blocks. 

The inner scope created by `do...end` following the invocation of `loop` has access to local variables `arr`, `counter`, and `sum` and as such, can modify the objects each variable references since they were initialized in the block's enclosing scope.

The main operation happening within the block scope involves reassignment `+=` and `-=`. `sum` is reassigned to its current value *plus* the value of the element at index `counter` in the array object by `arr`, and `counter` is reassigned to its current value *minus* `1`. Once the `break` condition is met, we exit `loop`, returning `nil`. Finally, on line `13` a string object with the integer object referenced by `sum` embedded (via string interpolation) is passed to `puts` and the string `Your total is 10` is output.

Example 7
```ruby
a = 'Bob'

5.times do |x|
  a = 'Bill'
end

p a
```
The concept here is that of **local variable scope**, specifically pertaining to methods being invoked with blocks. Since local variable `a` was initialized in the enclosing scope of the `do...end` block, the inner block can access `a` and modify `a`'s value. Thus when we invoke `p` and pass in `a`'s value, the string `Bill` is output and returned. This demonstrates the rule that inner scopes of method invocations blocks can access variables initialized in enclosing scopes.

Example 8
```ruby
animal = "dog"

loop do |_|
  animal = "cat"
  var = "ball"
  break
end

puts animal
puts var
```

The concept here is that of **local variable scope**, specifically pertaining to methods invoked with blocks. This snippet demonstrates the other side of the rule discussed in my Example 8 answer. In contrast to local variable `animal` (initialized outside the block), `var` is initialized in `loop do...end`'s inner scope. 

The first invocation of `puts` results in the updated string `cat` being output and `nil` returned. However, when the interpreter reaches the second invocation of `puts`, an `NameError` exception is thrown since `var` was initialized in the inner scope and as such, cannot be accessed in the enclosing scope.

Example 1 8.5
```ruby
a = 4
b = 2

2.times do |a|
  a = 5
  puts a
end

puts a
puts b
```
The main concept here is the behavior known as **variable shadowing**.  Since the local variable `a` (initialized in the outer scope of the `times do...end` scope) and block parameter `a` share the *same* name, block parameter `a` can be said to shadow the `a` initialized in the outer scope. 

This has implications for what is eventually output.  When `a` is reassigned to `5` on line 57 and passed as an argument to `puts` on 58, `5` is output and `nil` is returned. However, on line 61, when we invoke `puts` and pass as an argument the value of `a`, `4` is output. 

This is because the inner block scope *saw* the block parameter `a` first, which prevented the the block scope from accessing the outer scoped `a`. The only variable that was reassigned was the block parameter `a`. The value of `b`: `2` is also output to the screen. 

Example 2
```ruby
n = 10

1.times do |n|
  n = 11
end

puts n
```
Again, the main concept here is `variable shadowing`. Since local variable `n` (initialized on line 72) and block parameter `n` share their name, the block scope *sees* block parameter `n` before the `n` in the outer scope and thus is prevented from reassigning the outer variable. 

 This rule becomes evident when we call `puts` and pass it the value of `n`, `10` is output and `nil` is returned. The only reassignment that actually occurs is on line `73` when we change what block parameter `n` references (`0` -> `11`).