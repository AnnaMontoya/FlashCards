require "minitest/autorun"
require "minitest/pride"
require "./lib/round"
require "./lib/deck"
require "./lib/card"
require "./lib/guess"

class RoundTest < Minitest::Test

  def test_it_has_a_deck_of_cards
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck   = Deck.new([card_1, card_2])
    round  = Round.new(deck)

    assert_equal deck, round.deck
  end

  def test_that_history_of_guesses_are_collected
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck   = Deck.new([card_1, card_2])
    round  = Round.new(deck)

    assert_equal [], round.guesses
  end

  def test_it_knows_the_current_card
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck   = Deck.new([card_1, card_2])
    round  = Round.new(deck)

    assert_equal card_1, round.current_card
  end

  def test_it_holds_the_history_of_guesses_and_are_quantified
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck   = Deck.new([card_1, card_2])
    round  = Round.new(deck)

    round.record_guess("Juneau")

    assert_equal "Juneau", round.guesses.first.response
    assert_equal 1, round.guesses.count
  end

  def test_it_knows_how_many_questions_were_answered_correctly
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck   = Deck.new([card_1, card_2])
    round  = Round.new(deck)

    round.record_guess("Juneau")
    round.record_guess("blah")

    assert_equal 1, round.number_correct
  end

  def test_it_can_give_feedback
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck   = Deck.new([card_1, card_2])
    round  = Round.new(deck)
    round.record_guess("Juneau")

    assert_equal "Correct!", round.guesses.first.feedback
  end

  def test_it_will_give_a_new_card_once_answered_correctly

     card_1 = Card.new("What is the capital of Alaska?", "Juneau")
     card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
     deck   = Deck.new([card_1, card_2])
     round  = Round.new(deck)

     round.record_guess("2")
     round.new_card

     # I think somewhere along the line you thought new_card was current_card?
     # Be careful to make sure you are doing exactly what the spec asks you to.
     assert_instance_of Guess, round.record_guess("2")
     assert_equal 2, round.guesses.count
     assert_equal "Incorrect!", round.guesses.first.feedback
  end

  def test_that_it_can_calculate_percentage_of_correct_guesses

    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck   = Deck.new([card_1, card_2])
    round  = Round.new(deck)

    round.record_guess("Juneau")
    # Look at the spec for Iteration 4 a bit more closely.
    round.new_card
    round.record_guess("2")
    round.new_card

    assert_equal 1, round.number_correct
    assert_equal 50, round.percent_correct
  end
end
