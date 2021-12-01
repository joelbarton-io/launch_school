``` ruby
great = 'Roger'
greatest = great.concat(' Federer')

p great.object_id, great           # 720  "Roger Federer"
p greatest.object_id, greatest     # 720  "Roger Federer"

```
Line 2, local variable `great` is initialized to a string object with a value of `Roger`. On line 3, local variable `greatest` is initialized to the evaluated result of calling the `concat` method on the value of string object referenced by `great`. Concat is passed a string object with a value of `Federer`. Since `concat` mutates its caller, the value of the object referenced by `great` and `greatest` is `Roger Federer`. Both variables reference the same object now. On line 5, we call the `p` method with the evaluated result of invoking the `object_id` method on the value of the object referenced by `great` and the 



``` ruby
def palindrome?(string)
  string == string.reverse
end

def palindromic_number?(numbers)
  palindrome?(numbers.to_s)
end

puts palindromic_number?(1234545434321)

```
On line 10, the `puts` method is called and passed the evaluated result of invoking the palindromic_number? method with `1234545434321` as its argument. Upon invocation, method parameter `numbers` references integer `1234545434321`. On line 7, palindromic_number? returns the evaluated result of invoking the palindrome? method with the stringified integer object `1234545434321` as its argument.  Upon invocation, `palindrome`? method parameter `string` references...








``` ruby 
a = 4
b = 2

2.times do |a|
  a = 5
  puts a
end
puts b

puts a
```
on lines 2 and 3 local variables `a` and `b` are inititialized to Integers 4 and 2, respectively.  On line 5, the `times` method is invoked on integer 2 and passed a block as argument.  On the first iteration, block paramter `a` is assigned the current value of the calling object, 0. Block parameter `a` is then reassigned to integer 5 on line 6.  On line 7, the `puts` method is called with the value of block parameter `a` and 5 is output to the screen.  `puts` returns `nil`. On the second iteration of `times`, block parameter `a` is again assigned the current value of the calling object. 

``` ruby

def palindromic_number?(numbers)
  palindrome?(numbers.to_s)
end

puts palindromic_number?(1234545434321)

```
