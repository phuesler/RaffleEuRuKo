class Raffle
  def initialize(values,options = {delegate: nil, numberOfRuns: 20})
    @values = values
    @delegate = options[:delegate]
    @numberOfRuns = options[:numberOfRuns]
    @running = false
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
    1.upto(@numberOfRuns + rand(@numberOfRuns)) do
      value = @values[rand(@values.size)]
      @delegate.updateName(value) if @delegate.respond_to?(:updateName)
      sleep(0.1)
    end
    @values.delete(value)
    @running = false
  end
end
