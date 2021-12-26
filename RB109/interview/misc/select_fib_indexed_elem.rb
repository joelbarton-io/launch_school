=begin
select the element out of the array if its index is a fibonacci number"

algo: 
- traverse input, store elements with fib indices
- done

idxs 0 1 2 3 4 5 6
nums 0 1 1 2 3 5 8
- generate first 25 fibonacci numbers from scratch
  - start with seed
  - starting at 0, going up to n minus 1
    - add current indexed el and next indexed el,
    - add this to seed 
  - return seeed

=end
def fib_to_(n)
  seed = [0, 1]
  0.upto(n-1) do |idx|
    seed << seed[idx] + seed[idx+1]
  end
  seed
end

def fib_indices(array)
  array.select.with_index do |_, idx|
    fib_to_(25).any? { |fib| fib.eql?(idx)}
  end
end

# p fib_indices([1, 2, 3, 3, 2, 8, 9, 'a'])
# p fib_to_(10)