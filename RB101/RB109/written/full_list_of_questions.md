# Day 1

Example 1:
```ruby
a = “Hello”
b = a
a = “Goodbye”
puts a
puts b
```
Lines 7 and 8 output the string objects `Goodbye` and `Hello`, respectively. The core concept on display here is reassigment, since on lines 3-4, local variables `a` and `b` point to the same string object `Hello`, but then on line 6, `a` is reassigned to the string object `Goodbye`.

Example 2:
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
Line 22 outputs Integer 5 and returns `nil`.  However, line 23 throws a `NameError` exception since the local variable `b` was initialized in the inner scope of the block and is therefore neither visible nor accessible to the scope outside the `loop` method invocation with a block on lines 16-20. The snippet demonstrates how local variable scope works with blocks. Since `b` was initialized in the inner scope of the block, `b` is not visible or accessible outside of that inner scope.

Example 3:
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
Both `puts` method calls on lines 38 and 39 return `nil` and output Integers `3` and `2`, respectively. On lines 29-30, local variables `a` and `b` are initialized to Integers `4` and `2`, respectively. Then on line 32, the Kernel `loop` method is invoked and passed a block as its argument.  Within this block, we initialize local variable `c` to the Integer `3` and 'rea that local variable `c` references: `3`. Again, the main concept here is local variable scope as it pertains to method invocations with blocks. Since local variable `a` was initialized in the outer scope and currently holds reference to the same object as `c`, when we pass `a`'s value to `puts` as its argument, `a`'s updated value is output. 

Example 4:
```ruby
def example(str)
  i = 3
  loop do
    puts str
    i -= 1
    break if i == 0

  end
end
example('hello')
```
When we invoke `example` and pass in the string `hello`, `hello` is output 3 times to the screen and `nil` is returned. Upon invocation, `str` references `hello`. Then `puts` is invoked on line 48 and passed the object referenced by `str`. This happens three times since we are decrementing local variable `i` upon each block execution.  Once the value of `i` is 0, our `break` condition is met and we exit `loop`. -
Example 5:
```ruby
def greetings(str)
  puts str
  puts "Goodbye"
end

word = "Hello"
greetings(word)
```
On line 65, the `greetings` method invoked and passed the string object `Hello`, which is referenced by local variable `word`. Upon invocation, method parameter `str` also references the string object `hello`. What follows are two invocations of the `puts` method. The first `puts` is passed the string `Hello` as its argument and outputs `Hello`.  The second `puts` outputs `Goodbye`. Since line 61 is the last line evaluated within `greetings`, `puts`'s return value `nil` is implicitly returned by the `greetings` method invocation.

# Day 2

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

The main operation happening within the block scope involves reassignment `+=` and `-=`. `sum` is reassigned to its current value *plus* the value of the element at index `counter` in the array object referenced by `arr`, and `counter` is reassigned to its current value *minus* `1`. Once the `break` condition is met, we exit `loop`, returning `nil`. Finally, on line `13` a string object with the integer object referenced by `sum` embedded (via string interpolation) is passed to `puts` and the string `Your total is 10` is output.

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
The main concept here is the behavior known as **variable shadowing**.  Since the local variable `a` (initialized in the enclosing scope to `times do...end`) and block parameter `a` share their name, block parameter `a` can be said to shadow the `a` initialized in the outer scope.

This has implications for what is eventually output.  When `a` is reassigned to `5` on line 57 and passed as an argument to `puts` on 58, `'5'` is output twice and `nil` is returned. However, on line 61, when we invoke `puts` and pass as an argument the value of `a`, `4` is output. 

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

# Day 3 

#### Fred's Problem
```ruby
def fix(value)
  value << 'xyz'
  value = value.upcase
  value.concat('!')
end

s = 'hello'
t = fix(s)
```
- What is the value of the local variable `value` after line 6 is evaluated?
- What is the value of `t` and `s` after all of this code has run? Why?
- What concept(s) does this code demonstrate?

The two main concepts on display in the above code are Mutation and Reassignment. The value of local variable `value` after line 6 is the String `HELLOXYZ!`. And since local variable `t` is initialized to the return value of invoking `fix` with the string referenced by `s`, `t`'s value is also string `HELLOXYZ`. 

Final values of `t` and `s`:

`t`: "HELLOXYZ!"
`s`: "helloxyz"

We mutate the original object referenced by `s` and `value` on line 4 when we invoke `<<` on `value` and pass it a string argument `xyz`. However, since we reassign method parameter `value` to the return value (a new string object) of `value.upcase`, the effects of `.upcase` and `concat` do not apply to the original object.

#### Joel's Problem:
Q: "I want to see the string `written assessment` output to my screen twice. Instead, I'm seeing `written assessment` and `interview`. Why is this and what main concept(s) is being demonstrated?"
```ruby
def test
  puts "written assessment"
end

var = test

if var
  puts "written assessment"
else
  puts "interview"
end
```

The reason `written assessment` is not being output twice is because the `if` branch of the conditional is not evaluated. This can be explained when we consider the **implicit return** value of our `test` method invocation. 

Since `puts` is the last line evaluated in `test`, and we initialize local variable `var` to the return value of invoking `test`, local variable `var` references `nil` (the return value of `puts`).

So when `if` evaluates `var` and finds that it `var`'s value is `nil`, the `else` branch of the conditional is evaluated and the string `interview` is output. 

#### Ethan's Problem
- Discuss the return value(s) of the `do..end` block. Discuss the notable effects, if any, of these return values.
```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.select do |n| 
  n + 1
end
p new_array
``` 
The main concept here is **truthiness**. 

For all iterations, the return value from each `do...end` block execution will evaluate to true, since any number `+ 1` evaluates to `true`. `select` chooses those elements from `arr` for which the block returns `true` or evaluate to `true`, thus all integer elements in `arr` will be selected.

`new_array` references a new array object containing all elements from the original `arr` object. So, while `arr` and `new_array` look identical, they are in fact completely different objects with unique object ids.


# Day 4

#### Fred's Problem

```ruby
def add_name(arr, name)
  arr = arr + [name]
end

names = ['bob', 'kim']
add_name(names, 'jim')
puts names
```

- Is the `names` array altered by the `add_name` method invocation? Why or why not?
- What concept(s) does this code demonstrate?
#### answer:
The original array `names` is not altered by the method invocation of `add_name`.  Since `add_name` reassigns method parameter `arr`, no mutation occurs to the original object referenced by method parameter `arr` and local variable `names`. The return value of the `arr + [name]` concatenation operation is stored in this reassigned local variable `arr` and implicitly returned. However, this new array is not stored anywhere.

As evidenced in the output on line 10, the original array object is left un-mutated `['bob', 'kim']. The main concept here is a non mutating method. 

#### Joel's Problem
- What is the value of local variable `answer`? 
- What is the structure to the right of `any?` and how does it relate to the value of `answer`. Explain what is output.

```ruby
answer = { a: "ant", b: "bear", c: "cat" }.any? do |key, value|
  puts "value: #{value}"
  value.size >= 4
end
```
#### answer:
`answer`s value is Boolean `true`. The structure to the right of `any?` is a block  supplied to the `any?` method invocation as an argument.  In this example, based on how `any?` is implemented, as soon as the block returns `true`, `any?` ceases to iterate.

The outputs are: `'value: ant'` and `'value: bear'`. The last value, String `cat` is not output because `any?` terminates iteration as soon as `true` is given by the block execution. Since the second value in the calling object has a length >= integer `4`, this is the last key-value pair passed to the block, so this explains why only two strings are output. 


#### Ethan's Problem

```ruby
arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2.map! do |char|
  char.upcase
end

puts arr1 
puts arr2
```
- Does each `puts` method invocation in this example output the same thing?
- If so, why are they the same? If not, why are they different?
- What is the main concept(s) this code example demonstrates?
#### answer:
They output different values.  
Line 46 outputs: `'a' 'b' 'c'`
Line 47 outputs: `'A' 'B' 'C'`

The main concept on display here: **mutating `map!` and non mutating `upcase` methods**. 

The string elements present in both `arr1` and `arr2` are *shared* between the two array objects. Therefore, any mutating actions to the string objects themselves in *either array* will affect the elements in the other array. 

Since the destructive usage of `map!` only pertains to the array object referenced by `arr2` itself and not its elements, and since the `upcase` method is non-mutating, the string objects contained in `arr2` after `map!` finishes transforming,are new, different string objects from those in `arr1`.  Because `upcase` returns new string objects to `map!`, the original, lowercase string objects in `arr1` are left as they are.


# Day 5

#### Fred's Problem

```ruby

```


#### Joel's Problem
 
```ruby
number = 11
arr = [1, 2, 3, 4]
arr2 = arr.map { |num| number % num }

p arr
p arr2

```
### Question:
- Explain the discrepancy in the outputs from the two `p` method invocations.
- What **specific concept** accounts for these differing values being output?

The invocation of `map` returns a new array containing all of the block execution's return values. This means that whatever is returned from each block execution will be present in the new array `arr2`. 

The `%` method returns the remainder of dividing the element to `%`s left by the element to the right `num` until the left operand can no longer be evenly divided. This fact accounts for the difference. 

The main concept here is how `map` uses the implicit return values from the block execution to populate the new array it produces: the array `arr2` initialized on line 13.

#### Ethan's Problem
- Describe in detail every *operation* that takes place, in order.
- What is the return value of this piece of code? Why?
- *Side-question*: If you guys can think of a "main concept" here, I'd love to read your answer

```ruby
num = 3

num = 2 * num
```
return values:
Line 35 returns `3` and Line 37 returns `6`. 

On line 35, local variable `num` is initialized to the Integer `3`. On line 37, local variable `num` is reassigned to the return value of the `*` method, which multiplies integer `2` and the value of local variable `num`.

The main concept here is either **variables as pointers**, **reassignment**, or  the immutability of integer objects. 



#### OPTIONAL Question
### Question:
- What is the value of `arr2`? Why is this the case?
- What general programming principle are we violating?
- Be sure to discuss the code's output in your answer!

```ruby
arr = [1, 2, 3, 4]
arr2 = arr.map do |num| 
  arr.pop
  puts num
end
```
- mutating the caller while iterating

The above code outputs `1` and `2` and returns `[nil, nil]`. The value of `arr2` is also `[nil, nil]`. 

We can account for this outcome as being due to the fact that, on line 57, we mutate the object `arr` with `pop` (a destructive method) being iterated over by `map` *while* we are iterating over it. `arr.pop` changes the length of `arr` while we iterate over it, so by the time we have reached the end of our second iteration, there are no more elements to iterate over since we have `pop`ed off the last two elements.

This fact can be observed in how there are only two outputs: `1` and `2`. 
# Day 6

#### Fred's Problem

```ruby

```

#### Joel's Problem
 - Concisely describe what occurs in the last line of code (`array = yraar.sort`).
```ruby
a = 'abc'
b = 'abcd'
c = 'abcde3'
d = 'abcde4'
e = 'cab'

array = [a.chars.sort.join, c, d, b, a]
p array.sort
```
Local variable `array` is initialized to the new array that `yrrar.sort` returns.  `yraar` references an array object filled with string objects. Upon invocation, `sort` compares the string elements and orders them in accordance with their associated ASCii values. `array` now references an array object wherein the string elements contained in `yraar` are arranged from *smallest* to *greatest*.
#### Ethan's Problem

```ruby
def add_name(arr, name)
  arr = arr << name
end

names = ['bob', 'kim']
add_name(names, 'jim')
puts names
```

- Discuss the output of this code example, and why. Identify any important concepts in your explanation. Try to be concise.

- mutating method
- outputs: `bob` `kim` `jim`

Line 29 outputs three string objects: `bob` `kim` `jim`. The main concept being demonstrated here is how the method `<<` mutates its calling object, the array referenced by both local variable`names` and method parameter `arr`.  

On line 24, `<<` mutates the object referenced by `arr` and adds the String object `jim` to the end of the array referenced by `arr`.

While method parameter `arr` *is* technically **reassigned** on line 24, it is inconsequential as it still points to the same object.


#### BONUS: working with a collection method

- Describe the general process taking place on the last 3 lines of code. How do the return values from `select`'s block influence local variable `result`?
- Don't feel pressured to go into much detail about the first three lines of code.

```ruby
strings = ['a', ' ', 'T', 't']
numbers = [1, 1.3, 3, (2/2)]
misc = [:s, 222_333, ['_'], {s: ' '}]

multi_dim_array = [strings, numbers, misc]

result = multi_dim_array.select do |sub_array|
  sub_array == sub_array.uniq
end
```

Local variable `result` is initialized to the array object returned by invoking the `select` method on the array object referenced by local variable `multi_dim_array`.  `select` chooses those elements from `multi_dim_array` for which the block execution returns a truthy.  

Since the last line evaluated within the block execution uses the equality operator `==` to essentially see if the sub_arrays contain duplicates, only two of the sub_array elements are selected and included in the array referenced by `result`. 

Kari's question:

"Explain why a outputs 3 instead of 4 on line 10 . What structure is defined on lines 4–8? How does this structure affect a's final output and what is the underlying concept here?"


1  a = 4
2  b = 2
3
4  loop do
5    c = 3
6    a = c
7    break
8  end
9
10 puts a
11 puts b

The structure on lines 4-8 is a method invocation with a block. The final value of `a` and thus what is output on line 10 is `3` due to `a` being reassigned to the integer object referenced by `c` within the block scope. This reassignment is possible because block scopes have access to local variables in their enclosing (outer) scopes. local variable `a` is initialized in this outer scope and can therefore be accessed and reassigned from within the block.  The main concept here is scoping rules, particularly as they pertain to the behavior of local variables around method invocations with blocks.















# Find the length of the longest substring in the given string that contains exatly 2 characters "a" and 2 characters "e" in it.

# As an example, if the input was “aaee”, the substring (aaee) length would be 4.
# For a string "babanctekeaa", the longest substring is "babancteke" and its length is 10.

# If the length of the input string is 0, return value must be -1 and if none of the substrings contain 2 "a" and "e" characters return -1 as well.

# p longest_ae("aaee") == 4
# p longest_ae("babanctekeaa") == 10
# p longest_ae("xenoglossophobia") == -1
# p longest_ae("pteromerhanophobia") == 18
# p longest_ae("johannisberger") == -1
# p longest_ae("secaundogenituareabb") == 16
# p longest_ae("aaaa") == -1
