### Potential concepts include:

- variables act as pointers to locations in memory where objects exist ("two variables, one object")

- the scope of local variables with respect to...

  - method invocation with a block (outer encloses block scope) - The code within the block is executed for each iteration.
  - method definitions (self-contained scope)
    - Any variable initialized within a method definition can be used only within that method definition.

- mutating and non-mutating methods
- object passing (pbr & pbv)
- implicit return values from...
  - block executions
  - method invocations
- implementation details for methods...
"the contents of the object a method returns is based on the 
  - `sort`
  - `<=>`
  - `any?` -> `true` if the specified criterion is met for any collection element; early exit: short circuit
  - `all?` -> `true` only if all collection elements meet specified criterion; early exit
- Ruby syntactic conventions

Definitions

- "truthy" : the **state** of being true; if something is *truthy*, it *evaluates* as true
- `true` : Boolean object `true`; `false` : Boolean object `false`

if we initialize a local variable in the scope defined by a method definition, we cannot access that variable outside of that scope.
