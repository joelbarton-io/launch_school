

  class BankAccount
    attr_reader :balance

    def initialize(starting_balance)
      @balance = starting_balance
    end

    def positive_balance?
      balance >= 0
    end
  end

=begin

if we prefixed an @ symbol to `balance`, we would be directly referencing the instance variable
`@balance`. What we have currently is a the getter method for balance.

I'd tend to side with Ben here since it's generally best to not directly reference
an instance variable if you have a perfectly decent attr_reader for balance.

Technically, both work.
=end

account = BankAccount.new(100)


puts account.positive_balance?