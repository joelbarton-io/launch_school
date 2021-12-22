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
- Discuss the return value(s) of the `do..end` block. Discuss the effects, if any, of these return values.
```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

new_array = arr.select do |n| 
  n + 1
end
p new_array
```
The main concept here is **truthiness**. 

For all iterations, the return value from each `do...end` block execution will evaluate to true, since any number `+ 1` evaluates to `true`. `select` chooses those elements from `arr` for which the block returns `true` or evaluate to `true`, thus all integer elements in `arr` will be selected for `new_array`. 

`new_array` references a new array object containing all elements from the original `arr` object. So, while `arr` and `new_array` look identical, they are in fact completely different objects with unique object ids.

