1.
```ruby
if false
  greeting = "hello world"
end

greeting
```
What do you expect to happen when the greeting variable is referenced in the last line of the code below?

A `NameError` exception will be thrown.  Since the body of `if false` conditional is never evaluated, local variable `greeting` is never initialized. Ruby looks for a local variable or method with the name `greeting`, but will fail to find any and throw the exception


2.
``` ruby
greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings
```
What is the result of the last line in the code below?

Line 21, will output the contents of the `greetings` hash object: `a: 'hi there'`. On line 17, we initialize local variable `informal_greeting` to the original string object in the `greetings` hash. Since `informal_greeting` points at this object, when we invoke the mutating method `<<` and pass it a string ` there`, the original object is mutated.
