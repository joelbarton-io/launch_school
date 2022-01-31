class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

tv = Television.new
tv.manufacturer
tv.model

Television.manufacturer
Television.model

=begin
question:
What would happen if I called the methods like shown below?

We could get two no method errors, `Television:model` is an instance method and
`Television::manufacturer` is a class method so lines 12 and 16 would result in
NoMethodError exceptions being thrown as we are attempting to invoke the wrong type
of method on an instance of the Television class and the class Television itself.
=end