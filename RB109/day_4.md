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
The original array `names` is not altered by the method invocation of `add_name`.  Since `add_name` reassigns method parameter `arr`, no mutation occurs to the original object referenced by local variables `arr` and `names`. The return value of the `arr + [name]` operation is stored in this reassigned local variable `arr` and implicitly returned. However, this resulting array is not stored anywhere.

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
`answer`s value is Boolean `true`. The structure to the right of `any?` is a block argument supplied to the `any?` method invocation. 

The outputs are: 'value: ant' and 'value: bear'. The last value, String `cat` is not output because `any?` terminates iteration as soon as a `true` or truthy return value is given by the block execution. Since the second value's in the calling object has a length >= to integer 4, this is the last key value pair iterated over, so this explains why only two strings are output. 


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

The main concept on display here is: **mutating `map!` and non mutating `upcase` methods**.

The string elements present in both `arr1` and `arr2` are shared between the two copies. Therefore, any mutating actions direct to the string elements themselves in either array will be evident in the other array.

Since the destructive usage of `map!` only pertains to the array object `arr2` itself and not its elements, and since the `upcase` method is non-mutating, the elements contained in `arr2` are new, different string objects from those in `arr1` and `arr2` pre-`map!`.  Since they are new `upcase` returns new objects, the original, lowercase strings in `arr1` are left un-mutated. 
