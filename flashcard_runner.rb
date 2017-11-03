require "./lib/card"
require "./lib/guess"
require "./lib/deck"
require "./lib/round"

class FlashCardRunner
  attr_reader :deck, :round, :player_input

  def initialize(input)
    @deck  = Deck.new(cards)
    @round = Round.new(deck)
    @player_input = nil
  end

  def get_input
    @player_input = gets.chomp
  end

  def start
    puts "Welcome! You're playing with 4 cards."
    puts "-------------------------------------------------"
  end

  def current_round(number)
    @current_card = deck.cards[number - 1]
    puts "This is card number #{number} out of #{deck.cards.count}."
  end

  def card_question
    puts "Question: #{current_card.question}"
  end

  def guess_and_feedback
    rounds = @current_card
    card_question
    get_input
    rounds.record_guess(player_input)
    puts "#{round.guesses.last.feedback}"
  end

end

input = gets.chomp
flashcard_runner = FlashCardRunner.new(input)
flashcard_runner.start
