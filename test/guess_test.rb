require "minitest/autorun"
require "minitest/pride"
require "./lib/guess"
require "./lib/card"

class GuessTest < Minitest::Test
  def test_it_has_a_card
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)

    assert_instance_of Card, guess.card
    assert_equal "Juneau", guess.response
    assert_equal true, guess.correct?
    assert_equal "Correct!", guess.feedback
  end
end
