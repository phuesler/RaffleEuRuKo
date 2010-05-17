class ApplicationController
  attr_accessor :raffleContentView, :highestNumberTextField, :nameLabel
  
  def runRaffle(sender)
    @raffle = Raffle.new(Array.new(highestNumberTextField.stringValue.to_i){|i| i+1}, self)
    raffleContentView.runWithRaffle(@raffle)
  end
  
  def updateName(name)
    nameLabel.stringValue = name
  end
end
