Ex: 9
``` ruby 
def repeater(string)
  result = ''
  string.each_char do |char|
    result << char << char
  end
  result
end

repeater('Hello')
```
On line 12, the repeater method is invoked with the string argument 'Hello'.  Upon invocation, repeater method parameter `string` stores reference to the string 'Hello'. On line 5, local variable `result` is initialized to an empty string. On lines 6-8, the `.each_char` method is called on `string` and passed a block as an argument. Block variable `char` is also declared. The block parameter `char` is assigned to the value of the current element in the string `string`. Each time the block runs, the value of `char` is twice concatonated to the value of `result` via the shovel method. Upon completion, on line 9, the value of `result` is returned from repeater.

Ex: 8
``` ruby 
x = "hi there"
my_hash = {x: "some value"}
my_hash2 = {x => "some value"}
```

On line 17, local variable `x` is initialized to the string "hi there". On line 18, variable `my_hash` is initialized to a hash object containing one key-value pair. The key in `my_hash` is symbol `x` with an associated value of string 'some value'. On line 19, my_hash2 is initalized to a hash object containing one key-value pair. The key of `my_hash2` is local variable `x` which, as we know from before, references the string 'hi there'. It's worth mentioning that, since local variable `x` and `my_hash`'s key `x` reference the same object in memory, any changes will be  reflected in other occurrences. Something interesting to note here is the diverging syntax within our two respective hash objects. my_hash2 is atypical as it uses pre-ruby 1.9 style of key value assignment (eg: =>).

Ex: 7
``` ruby 
total = 0
[1, 2, 3].each do |number|
  total += number
end
puts total # 6
```

On line 26, local variable `total` is initialize to Integer 0. On line 27, the `each` method is invoked on an array object and passed a `do...end`  block as an argument. Block parameter `number` is declared here as well. Upon each iteration and running of the block, `number` is assigned the value of the current element in the calling object. On line 28, local variable `total` is reassigned to the sum of `total` and the present value of block parameter `number`. On line 30, the `puts` method is invoked with the value of `total` as its argument. Integer 6 is printed to the console and `nil` is returned.

Ex: 6
``` ruby 
def test(b)
  b.map {|letter| "I like the letter: #{letter}"}
end

a = ['a', 'b', 'c']
test(a)
```

On line 41, local variable `a` is initialized to an array object containing strings. On line 42, the `test` method is invoked with `a`'s value as its argument. Upon invocation, `test` parameter `b` holds reference to the same array object referenced by `a`. On line 38 the `map` method is invoked on method variable `b` and passed a `{...}` block as an argument. Block parameter `letter` is declared here. Upon each iteration and running of the block, the value of block parameter `letter` is embedded into the string around it via the string interpollation expression `#{letter}`. This resulting string is returned from the block and added to the new array object returned by the `map` method. The evaluated result of calling the `test` method with local variable `a`'s value returns the new array 

Ex: 5
``` ruby
def include?(arr, search_item)
  !arr.each { |item| return true if item == search_item }
end

include?([1, 2, 3, 4, 5], 6)
```

