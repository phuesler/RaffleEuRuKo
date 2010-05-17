require 'Tests/test_helper'

require 'Raffle'

class RaffleTest < Test::Unit::TestCase
  def setup
    @delegate =  MiniTest::Mock.new
  end
  
  def test_is_running
    raffle = Raffle.new([1],null_object)
    raffle.raffle
    assert(true, raffle.running?)
    while(raffle.running?)
      sleep(0.1)
    end    
  end
  
  def test_is_not_running
    raffle = Raffle.new([1],null_object)
    assert_equal(false,raffle.running?)
  end
  
  def test_call_delegate_methods
    @delegate.expect :updateName,nil,[1]
    @delegate.expect :updateName,nil,[2]
    @delegate.expect :updateName,nil,[3]
    
    raffle = Raffle.new([1,2,3],@delegate)
    raffle.raffle
    #we have to wait until raffle has finished running in another thread
    while(raffle.running?)
      sleep(0.1)
    end
    @delegate.verify
  end
end