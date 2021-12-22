``` ruby
a = 'hello'
b = a
a = 'goodbye'
```
Local variable `a` is initialized to the string object with the value of `hello`. 
Local variable `b` is initialized and references the same string object as `a`. Then, local variable `a` is reassigned to a different string object, with a different value `goodbye`. 
We now have two local variables references two different string objects. 

```ruby
def example(str)
  i = 3
  loop do
    puts str
    i -= 1
    break 'hi' if i == 0
  end
end

example('hello')
```
On line 20, we invoke the `example` method and pass in a string object with the value of `hello`.  Upon invocation and within the inner scope of the method, method parameter `str` references the string object with the value of `hello`.

On line 12, local variable `i` is initialized to the integer `3`. On line 13, the `Kernel#loop` method is invoked and passed a `do...end` block as an argument. Upon invocation, a new, block scope is generated.  Since the inner scope of the block can access variables initialized in outer scopes, the `do...end` scope has access to both `str` and `i`, along with the objects they reference. 

The string `hello` is output 3 times to the screen since our break condition stipulates that we will `break` out of the loop as soon as the value of `i` is equal to `0`. Once we have broken out of the `loop`, `nil` is returned, because the last evaluated line of code was the `break` line, and `break` returns `nil`.  
```ruby

a = 4

loop do
  a = 5
  b = 3
  break
end

puts a
puts b
```
-concept: local variables and how they behave around method invocations with blocks. 

- expected output: `5` and `NameError`. 
Local variable `a` is initialized on line 29 to the integer `4`. The `loop` method is then invoked and passed an block as argument. This invocation generates an inner, block-level scope to be generated. On 32, local variable `a` is reassigned to integer `5`.  This is possible because local variables initialized in outer scopes can be accessed and manipulated in inner, method invocation with a block-level scopes. 

On line 33, local variable `b` is initialized to integer `3`, after which we `break` out of the `loop do...end` . Line 37 outputs `5`, reflecting the variables reassignment on line 32, and returns `nil` (`puts` always returns `nil`)

However, when we invoke `puts` and pass in `b` as its argument, ruby throws an exception.  This is because `b` was initialized in the inner, block-level scope and is thus invisible and inaccessable to the out scope. This will result in a NameError because the outer scope relative to a block-scope can only those variables that were initialized outside the block. 

```ruby
a = 4
b = 2

loop do
  c = 3
  a = c
  break
end

puts a
puts b
```
output: `3` `2`
return: `nil` 

On lines 50-51, local variables `a` and `b` are initialized to integers `4` and `2`, respectively.  Lines 53-57, where the `loop` method is invoked and passed a `do...end` block as argument open an inner scope. Within that inner scope, local variable `c` is initialized to the integer `3`. 

Then, local variable `a` (initialized in the outer scope), is reassigned to the integer object referenced by `c`. At this point, `a` and `c` reference the *same* integer object. 

Once we `break` out of `loop`, local variable `a` references integer `3`. When we invoke `puts` twice on lines 59 and 60, the integers `3` and `2` are output and `nil` is returned. Since we initialized `a` in the outer scope, we could reassign it to point at the object that `c` referenced in the inner scope. Again, this demonstrates how, when we initialize a local variable in the enclosing scope to a method invocation with a block, the scope of the block can access and modify outer variables, but not the other way around.

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
Lines 72-73, local variables `a` and `b` are initialized to the integers `4` and `2`, respectively. Lines 75-78 define a new inner scope. The `times` method is invoked on the integer `2` and passed a `do...end` block as argument.  Block parameter `a` shadows the outer local variable `a` as they have the same name, thus preventing the outer `a` from being modified by actions occurring in the inner scope.

The reassignment on line 76 is actually alters what block parameter `a` points at. In both block executions, line 76 reassigns block parameter `a` (which is 0, then 1)  to `5` twice.

