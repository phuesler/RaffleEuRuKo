class RaffleView < NSView
  KEY_CODE_ESC = 53
  KEY_CODE_SPACE_KEY = 49
  
  def runWithRaffle(raffle)
    @raffle = raffle
    enterFullScreenMode(self.window.screen,withOptions:nil)
    @raffle.raffle
  end
  
  def keyDown(theEvent)
    if theEvent.modifierFlags & NSNumericPadKeyMask
      handleKeyCode(theEvent)
    else
      super.keyDown(theEvent)
    end
  end
  
  def handleKeyCode(theEvent)
    case theEvent.keyCode
      when KEY_CODE_ESC then
        exitFullScreenModeWithOptions(nil)
      when KEY_CODE_SPACE_KEY then
        @raffle.raffle unless @raffle.running?
    end
  end
end
