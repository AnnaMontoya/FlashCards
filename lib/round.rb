require "./lib/guess"
require "./lib/deck"
require "pry"

class Round
  attr_reader   :deck, :guesses, :card_index, :number_correct
  attr_accessor :card_index

  def initialize(deck)
    @deck           = deck
    @guesses        = []
    @card_index     = 0
    @number_correct = 0
  end

  def current_card
    deck.cards[@card_index]
  end

  def record_guess(answer)
    guess = Guess.new(answer, current_card)
    @guesses << guess
    @number_correct += 1 if guess.correct?
    guess

  end

  def new_card
    if !@guesses.last.correct?
      deck.cards.push(deck.cards[@card_index])
    else
      @card_index += 1
      current_card
    end
  end

  def percent_correct
  (@number_correct.to_f / @guesses.count.to_f * 100).to_i 
  end

end

# input = gets.chomp
# while (input!= 'exit')
#   Round.new
#   if input == "find"
