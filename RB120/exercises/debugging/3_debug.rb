class Person
  attr_reader :name
  attr_accessor :location

  def initialize(name)
    @name = name
  end

  def teleport_to(latitude, longitude)
    @location = GeoLocation.new(latitude, longitude)
  end
end

class GeoLocation
  attr_reader :latitude, :longitude

  def initialize(latitude, longitude)
    @latitude = latitude
    @longitude = longitude
  end

  def to_s
    "(#{latitude}, #{longitude})"
  end
end

# Example

ada = Person.new('Ada')
ada.location = GeoLocation.new(53.477, -2.236)

grace = Person.new('Grace')
grace.location = GeoLocation.new(-33.89, 151.277)

ada.teleport_to(-33.89, 151.277)

#puts ada.location                   # (-33.89, 151.277)
#puts grace.location                 # (-33.89, 151.277)
print ada.location.inspect #== grace.location # expected: true
                                    # actual: false
=begin
I believe the reason is because the `==` on line 39 is actually comparing two separate GeoLocation objects.
While the two object's respective states reference identical coordinate values, we are not comparing these values,
we are comparing instances of the GeoLocation class. Part of the confusion stems from the custom `to_s` method
defined on lines 22-24. When we call `puts` on lines 37 and 38, the custom `to_s` method is called, which returns
the string specified on line 23.

`ada.location` actually returns an object signature.
=end