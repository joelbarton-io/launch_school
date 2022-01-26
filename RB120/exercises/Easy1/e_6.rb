class Flight
  attr_reader :database_handle # delete this 

  def initialize(flight_number)
    @database_handle = Database.init
    @flight_number = flight_number
  end
end

# There is nothing technically incorrect about this class, but the 
# definition may lead to problems in the future. How can this class be 
# fixed to be resistant to future problems?
=begin
since we are working with a database, it probably doesn't make sense
to have a writer setter method for the database_handle.  It seems like
it would be important to preserve the init. 

Edit: delete it outright
