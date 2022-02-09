=begin
We created a simple BankAccount class with overdraft protection, that does not allow
a withdrawal greater than the amount of the current balance. We wrote some example code
to test our program. However, we are surprised by what we see when we test its behavior.
Why are we seeing this unexpected output? Make changes to the code so that we see the
appropriate behavior.
=end

class BankAccount
  attr_reader :balance

  def initialize(account_number, client)
    @account_number = account_number
    @client = client
    @balance = 0
  end

  def deposit(amount)
    if amount > 0
      self.balance += amount
      "$#{amount} deposited. Total balance is $#{balance}."
    else
      "Invalid. Enter a positive amount."
    end
  end

  def withdraw(amount)
    if amount > 0
      success = valid_transaction?((self.balance -= amount))
    else
      success = false
    end

    if success
      "$#{amount} withdrawn. Total balance is $#{balance}."
    else
      "Invalid. Enter positive amount less than or equal to current balance ($#{balance})."
    end
  end

  def balance=(new_balance)
    if valid_transaction?(new_balance)
      @balance = new_balance
      true
    else
      false
    end
  end

  def valid_transaction?(new_balance)
    new_balance >= 0
  end
end

# Example

account = BankAccount.new('5538898', 'Genevieve')

                          # Expected output:
p account.balance         # => 0
p account.deposit(50)     # => $50 deposited. Total balance is $50.
p account.balance         # => 50
p account.withdraw(80)    # => Invalid. Enter positive amount less than or equal to current balance ($50).

                          # Actual output: $80 withdrawn. Total balance is $50.
p account.balance         # => 50
p account.withdraw(40)

=begin
previously, on line 29 when we invoked the balance setter method and subtracted the amount,
the local variable `success` was being assigned to the integer -30.  Since -30 evaluates truthy
in a boolean context, the wrong portion of the `if...else...end` conditional on lines 34-38
was being evaluated.

We fixed it to work properly by changing line 29.  `success` is only ever assigned to reference
boolean `true` when the expression is greater than or equal to 0. Otherwise, `success` is
assigned to `false` and making a withdrawl is denied.
=end