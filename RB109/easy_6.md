```ruby
def fix(value)
  value.upcase!
  value.concat('!')
  value
end
s = 'hello'
t = fix(s)
```

On line 8, local variable `s` is initialized to string `'hello'`. On line 9, local variable `t` is initialized to the evaluated result of invoking `fix` with the value of `s` as its argument. Upon invocation, method parameter `value` references string `'hello'`. On line 4, destructive string method upcase! is called on the value of value. 



```ruby

pets = ['cat', 'dog', 'fish', 'lizard']
my_pet = pets[2]
puts "I have a pet #{my_pet}!"
```
On line 2, we initialize local variable `pets` to an array containing four strings.  On line 3, we initialize local variable `my_pet` to the 2-indexed element in `pets`, which is the string `'fish'`.  We utilize the `Array#[]` method to accomplish this action. On line 4, we call the `puts` method with a string argument.  Embedded in this string is the #{my_pet}