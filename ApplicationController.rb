class ApplicationController
  attr_accessor :raffleContentView, :highestNumberTextField, :nameLabel
  
  def runRaffle(sender)
    @raffle = Raffle.new(Array.new(highestNumberTextField.stringValue.to_i){|i| i+1}, delegate:self, numberOfRuns: 20)
    raffleContentView.runWithRaffle(@raffle)
  end
  
  def updateName(name)
    nameLabel.stringValue = name
  end
end
