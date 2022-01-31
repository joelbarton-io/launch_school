class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    quantity = updated_count if updated_count >= 0
  end
end

=begin
Alyssa looked at the code and spotted a mistake. "This will fail when update_quantity is called", she says.

Can you spot the mistake and how to address it?

line 11, ruby will think we are initializing a new local variable scoped to the
`update_quantity` instance method when what we mean to do is update the value
referenced by the `quantity` instance variable. We can solve this issue by
prepending `self.` to `quantity` to inform ruby that we are invoking the
setter method `quantity=` and updating the value of the instance variable
`@quantity`


Missed:

I neglected to mention that we need to adjust the attr_reader for `quantity` to
an attr_accessor; giving us access to a setter method, which is what our approach
calls for.
=end