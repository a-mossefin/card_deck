#===================================================
#Run this file in the terminal to test with readout
#===================================================
require_relative 'card_deck'

def deck_test
  deck = Deck.new
  hand = []
  deck.cards.shuffle!
  top_card = deck.cards.first

  #Check that there are 52 cards in the deck
  assert_equal(deck.cards.size, 52)

  #Check that first card is removed from deck when drawn
  hand << deck.draw_from_top

  assert_not_equal(top_card, deck.cards.first)
  assert_equal(hand[0], top_card)
  assert_equal(deck.cards.size, 51)

  #Check that card is replaced to the bottom
  deck.place_at_bottom(top_card)

  assert_equal(deck.cards.last, top_card)
  assert_not_equal(deck.cards.first, top_card)
  assert_equal(deck.cards.size, 52)
end

def card_test
  card_1 = Card.new("Diamonds", "Ace", 12)
  card_2 = Card.new("Spades", "3", 1)

  #Check for high card
  assert_equal(card_1.rank > card_2.rank, true)
  assert_not_equal(card_2.rank > card_1.rank, true)
end

#Added to emulate a basic test suite for visual results in terminal
@failed = 0
@passed = 0

def assert_equal(x, y)
  if x == y
    print "✔ "
    @passed += 1
  else
    print "ⓧ "
    @failed += 1
  end
end

def assert_not_equal(x, y)
  if x != y
    print "✔ "
    @passed += 1
  else
    print "ⓧ"
    @failed += 1
  end
end

def run_tests
  starting = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  deck_test
  card_test
  puts " "
  ending = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  puts "Finished in #{ending - starting}"
  puts "Total assertions: #{@passed + @failed}, Passed: #{@passed}, Failed: #{@failed}"
end

run_tests
    