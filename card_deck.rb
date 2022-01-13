class Deck
  attr_reader :cards

  def initialize
    @cards = build_deck
  end

  def build_deck
    cards = []
    suits = %w(Spades Hearts Diamonds Clubs)
    title = %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace)
    suits.each { |suit|
      title.each_with_index { |title, index|
        cards << Card.new(suit, title, index)
      }
    }
    return cards
  end

  def draw_from_top
    @cards.shift
  end

  def place_at_bottom(card)
    @cards.push(card)
  end
end

class Card
  attr_reader :suit, :title, :rank

  def initialize(suit, title, rank)
    @suit = suit
    @title = title
    @rank = rank
  end
end
