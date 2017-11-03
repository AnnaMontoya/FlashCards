require "minitest/autorun"
require "minitest/pride"
require "./lib/card"

class CardTest < Minitest::Test
  def test_it_has_a_question_and_answer
    card = Card.new("What is the capital of Alaska?", "Juneau")

    assert_equal "What is the capital of Alaska?", card.question
    assert_equal "Juneau", card.answer
  end
  # Would like to have seen a secondary test checking that a card could
  # hold a different set of data like below:
  #
  def test_it_can_hold_different_data
    card = Card.new("Who is better than Justin Bieber", "Literally Anyone")

    assert_equal "Who is better than Justin Bieber", card.question
    assert_equal "Literally Anyone", card.answer
  end
end
