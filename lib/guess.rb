class Guess
  attr_reader :response, :card

  def initialize(response, card)
    @response = response
    @card     = card
  end

  def correct?
    @response == card.answer
  end

  def feedback
    if correct?
      p "Correct!"
    else
      p "Incorrect!"
    end
  end

end
