class Raffle
  def initialize(values,delegate)
    @values = values
    @delegate = delegate
  end
  
  def raffle
    NSThread.detachNewThreadSelector(:run, toTarget: self, withObject: nil)
  end
  
  def running?
    @running
  end
  
  private
  
  def run
    @running = true
    value = nil
    1.upto(20 + rand(20)) do
      value = @values[rand(@values.size)]
      @delegate.updateName(value)
      sleep(0.1)
    end
    @values.delete(value)
    @running = false
  end
end
