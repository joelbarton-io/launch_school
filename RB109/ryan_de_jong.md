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
On line 53, the `include?` method is invoked with two object arguments: an array and an integer.  Upon invocation, method parameters (present in `include?`'s method definition, lines 49-51) `arr` and `search_item` reference the passed in array and integer arguments, respectively.  On line 51, The `each` method is invoked on method parameter `arr` and passed a `{...}` block as its argument. Upon each iteration of `each` and running of the block, block parameter `item` is assigned the value of the current element in our calling object `arr`.  The block will return boolean object true when the current value of `item` is equal to the value of `search_item` (using the comparison operator `==`).  On line 51, since we know that the `each` method invariably returns its calling object–in this case, `arr` the bang operator `!` effectively negates `arr`'s truthiness property.  This is the last line of code evaluated, thus the `include?` method returns boolean false.

Ex: 4
``` ruby
def merge(array_1, array_2)
  array_1 | array_2
end

arr1, arr2 = ['hello'], ['hello', 'world']
merged = merge(arr1, arr2)
merged[0][0] = 'J'
p merged
p arr1
p arr2
```
On line 63, local variables `arr1` and `arr2` are initialized to array objects containing strings.  It's worth noting that this single line assignment is made possible by **parallel assignment**, which allows a developer to initialize multiple variables separated by commas to multiple values separated by commas.  On line 64, we initialize local variable `merged` to the evaluated result of calling the `merge` method with the values of `arr1` and `arr2` as arguments. On line 59, upon invocation, method parameters `array_1` and `array_2` reference the passed-in values.  On line 60, the `Array#|` method is invoked on `array1` and passed `array2` as an argument. `merge` then returns a **new array** containing two strings `['hello', 'world']`. It should be noted that the first string element of this new array, `'hello'` is the **same** string object as the `'hello'` contained in `arr1` array. 

On line 65, we invoke the `Array#[]` method, accessing the element in `merged` at index 0, whose present value is the string `'hello'`.  Then, we invoke the `String#[]=` method on `'hello'`, accessing the element at index 0, whose present value is `'h'` and setting it to string `'J'`.  Since `[]=` is destructive, this change is reflected in other instances of this particular `'hello'` object. So on line 66, when we invoke the `p` method with the value of `merged` as an argument, `['Jello', 'world']` will be output to the screen and returned by `p`.  Similarly, on line 67 when `p` is invoked with `arr1`, `['Jello']` is output to the screen and returned.  On line 68, when `p` is invoked with `arr2`, `['hello', 'world']` is output to the screen and returned.

Ex: 3
``` ruby 
def short_long_short(string1, string2)
  if string1.length > string2.length
    string2 + string1 + string2
  else
    string1 + string2 + string1
  end
end

short_long_short('abc', 'defgh')
```
On line 84, the method `short_long_short` is invoked with two string objects: `'abc'`, `'defgh'` as its arguments.  Once invoked, `short_long_short`'s parameters `string1` and `string2` reference the passed-in string objects `'abc'`, `'defgh'`. Lines 77-81 involve a conditional `if...else...end` structure.  On line 77, we have two calls to the `String#length` method. Each call returns the **number** of characters in the respective calling object.  Since the expression: `3 > 5` (which implements the `Integer#>` comparison operator) evaluates to `false` which has a falsey quality, the `if` branch of our conditional structure is **not** evaluated and we move to the `else` branch.  On line 80, there are two successive string concatonations (`+`) which result in a **new string** `'abcdefghabc'` being returned out of the `short_long_short` method. 

Ex: 2
``` ruby
[1, 2, 3].each do |num|
  puts num
end
```
On line 90, the `Array#each` method is invoked on an array of integers and passed a `do...end ` block as an argument. Upon each iteration of the `each` method and block execution, block parameter `num` is assigned the **current element** of the calling array. On line 91, the puts method is called with block parameter num and output to the screen.  `Puts` returns `nil` to `each`, but since `each` isn't concerned with it's block's return value, it does nothing with `nil`. Once `each` is done iterating over its calling array, it returns caller.

Ex: 1
```ruby 
a = 1 

loop do       
  puts a 
  a = a + 1   
  break      
end

puts a 
```
On line 98, local variable `a` is initialized to 1.  Next, the `loop` method is called and passed a `do...end` block as an argument. On line 101, the `puts` method is invoked with the value of `a` as its argument and outputs `1` and returns `nil`. Next, variable `a` is reassigned to the sum of `a`'s value and `1` (integer 2). Once we reach keyword `break`, we exit out of the `loop`.  Finally, on line 106, the `puts` method is called with the value of `a` as its argument, `2` is output to the screen and `nil` is returned. 