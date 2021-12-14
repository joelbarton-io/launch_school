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

The % method returns the remainder of dividing the element to `%`s left by the element to the right `num`. This fact accounts for the difference. 

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

On line 35, local variable `num` is initialized to the Integer `3`. On line 37, local variable `num` is reassigned to the return value of the `*` method, which multiplies integer `2` and the value of local variable `3`.

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