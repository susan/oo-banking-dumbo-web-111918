require 'pry'
class Transfer
  # your code here
  #
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, status = "pending", amount)
  	@sender = sender
  	@receiver = receiver
  	@status = status
  	@amount = amount
  end

  def valid?
  	sender.valid?
  	receiver.valid?
  	#the test passes in sender and receiver as objects for bank account, otherwise c
  	#can't do this
  end

   def execute_transaction
     if sender.balance > amount && status == "pending"
     	sender.balance = sender.balance - amount
     	receiver.balance = receiver.balance + amount
     	self.status = "complete"
     else
     	self.status = "rejected"
       "Transaction rejected. Please check your account balance."
     end
   end

    def reverse_transfer
      if self.status == "complete"
      	sender.balance = sender.balance + amount
      	receiver.balance = receiver.balance - amount
      	self.status = "reversed"
       end
     end

end
transfer1 = Transfer.new("amanda", "susan", 4000)
#binding.pry
