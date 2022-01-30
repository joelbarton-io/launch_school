class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end

trip = RoadTrip.new
trip.predict_the_future

=begin
the program looks for a method called 'predict_the_future'
in the `RoadTrip` class but does not find it there.  So it
looks in `RoadTrip`'s super class `Oracle` and finds 'predict_the_future'.
`predict_the_future` is invoked on the object referenced by trip.

This result in one of three possible strings being sampled
and appended to the "You will" string on line 3. This string
is returned following the `predict_the_future` instance method
invocation.

Didn't know how to say:

Since the instance method `predict_the_future` is invoked on an instance
of the RoadTrip class, once ruby resolves the `predict_the_future` method
look up and starts looking for the `choices` instance method, it returns
to the RoadTrip class to again start its search.

So, when a method lookup is resolved, "ruby" returns to the calling object's class.

=end