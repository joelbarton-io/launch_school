class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end
# what is the result of executing this code?
oracle = Oracle.new
oracle.predict_the_future

=begin
invoking the instance method `predict_the_future` on the
the oracle object will result in one of three possible string
combinations being returned returned.
=end