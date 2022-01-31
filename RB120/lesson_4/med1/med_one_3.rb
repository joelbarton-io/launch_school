class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    self.quantity = updated_count if updated_count >= 0
  end

  private

  attr_writer :quantity
end

=begin
Alyssa noticed that this will fail when update_quantity is called. Since quantity
is an instance variable, it must be accessed with the @quantity notation when setting
it. One way to fix this is to change attr_reader to attr_accessor and change quantity
to self.quantity.

Is there anything wrong with fixing it this way?


I don't think there's anything explicitly wrong with this approach.  An improvement
would be to implement method access control. I would place the attr_writer
for :quanity under a protected or private keyword, so as to ensure that the
value of instance variable `@quantity` can only be set from within the InvoiceEntry
class, keeping it away from the public interface.
=end