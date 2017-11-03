require "minitest/autorun"
require "minitest/pride"
require "./lib/card"

class CardTest < Minitest::Test
  def test_it_has_a_question_and_answer
    card = Card.new("What is the capital of Alaska?", "Juneau")

    assert_equal "What is the capital of Alaska?", card.question
    assert_equal "Juneau", card.answer
  end
  
end
