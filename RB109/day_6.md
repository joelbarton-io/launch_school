#### Fred's Problem

```ruby

```

#### Joel's Problem
- In as few words as possible, describe what occurs within the last expression in the snippet (`p array.sort`).
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