require "minitest/autorun"
require "minitest/pride"
require "./lib/deck"
require "./lib/card"

class DeckTest < Minitest::Test

  def test_it_holds_cards
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck   = Deck.new([card_1, card_2])

    assert_equal [card_1, card_2], deck.cards
    assert_equal 2, deck.count
  end
end
