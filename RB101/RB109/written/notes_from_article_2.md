re: https://launchschool.medium.com/ruby-objects-mutating-and-non-mutating-methods-78023d849a5f 
- They describe an object as being *used* to call a method. -> `'hello'.sub!('e', 'a')`

- While `=` isn't an *actual* method, it behaves like a non-mutating method; treat it as such
  - also, if we mutate an object to the right of `=`, that operation occurs `before` the reassignment operation

- if we initialize a local variable to the return value of a method invocation, and that method invocation's implicit return is a method parameter (which references an object), then we should stay that the newly initialized local variable stores a **reference** to the object referenced by the method parameter.

- mutating methods: Question: does it mutate the caller or its arguments?
- fairly cavalier usage of 'copy' (Objects) and 'alias' (variables & parameters)

- *indexed assignment*
``` ruby 
letters = [`b`, `a`, `d`]
letters[0] = 's'
```
1. `letters[0]` **mutates** the Array referenced by `letters` to the extent that no new object is returned
2. it is the collection *element* at the specified index that is **reassigned**; the collection itself is **mutated**
3. The `array[0]` structure is kind of like a *local variable* in the sense that it is just a reference to some **element** in the collection.
