=begin
What are collaborator objects, and what is the purpose of using them in OOP?
Give an example of how we would work with one.

Collaborator objects are objects that are referenced by an instance variable of other, different
objects.  If an object is stored as part of another object's state, it is a collaborator object. Typically,
we don't consider objects defined in the core library as collaborators ('some string', 2, [], etc), however
they technically are collaborator objects.  Usually, it's an instance of a user-defined class that's called
a collaborator object if it is referenced by another object's instance variable and thus comprising
part of that object's state.

Collaborator objects are useful in that they help to model and make sense of the relationships between
different classes that are working in concert.  In a sense, collaborator objects help to represent the
connections between different parts of our program by abstracting certain areas of our code to more
easily digestible concepts or ideas.

The idea of a `Deck` as being comprised of a set of `Card` objects is a lot easier to work with
and think about than a bunch of individual sub array objects whose elements include a string and integer
all together in some massive array.

Using collaborators helps us to focus more heavily on the overall design of the program via
abstraction of certain problem domains to more digestible concepts (e.g. Cards in a Deck)
=end