class PhoneNumberDB
  attr_reader :phone_number

  def initialize(pin, phone_number)
    @pin = pin
    @phone_number = phone_number
  end

  def change_phone_number_to(new_number, input_pin)
    unless input_pin == pin
      return 'Invalid'
    end
    self.phone_number = new_number
  end

  private

  attr_writer :phone_number
  attr_reader :pin
end

joel = PhoneNumberDB.new('123', '123456789')
puts joel.phone_number
joel.change_phone_number_to('123', '321654987')
puts joel.phone_number

=begin
Why is it generally safer to invoke a setter method (if available) vs. referencing the instance
variable directly when trying to set an instance variable within the class? Give an example.

It's preferred to use a setter over direct reference because it makes making changes further down
the road within a class much more convenient, since you only have to make them in one place (the setter
method's definition). Additionally, using a setter allows you to implement protections for what conditions
might need to be met in order to be allowed to change some instance variable's value.

It's better to rely on methods than explicit assignment. We want our code to rely on sending "messages"
(calling methods on objects) as opposed to explicit, hard-coded reassignment.
=end
