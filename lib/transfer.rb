class Transfer
  attr_accessor:sender, :receiver, :status, :transfer,:amount
  
  def initialize (sender,receiver,amount)
    @sender = sender 
    @receiver = receiver 
    @amount = amount
    @status = "pending"
  end 
  
   def both_valid?
    if @sender.both_valid? && @receiver.both_valid?
      true 
    else 
      false 
  end 
end 

  def execute_transaction 
    if both_valid? && status == "pending"
      if amount < self.sender.balance
        self.sender.balance -= amount
        self.receiver.balance += amount
        self.status = "complete"
      else
         self.status = "rejected"
         "Transaction rejected. Please check your account balance."
      end
    else
       self.status = "rejected"
       "Transaction rejected. Please check your account balance."
    end
  end 

  def reverse_transfer
    if @status == "complete"
      @sender.deposit( @amount ) 
      @receiver.deposit( @amount * -1)
      @status = "reversed"
    end
  end
end
