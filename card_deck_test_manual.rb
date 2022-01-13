#===================================================
#Test scripts to run manually
#===================================================
require_relative 'card_deck'

#Deck tests
#=================================
deck = Deck.new
hand = []
deck.cards.shuffle!
top_card = deck.cards.first

#Check that there are 52 cards in the deck
deck.cards.size == 52

#Check that first card is removed from deck when drawn
hand << deck.draw_from_top

top_card != deck.cards.first
hand[0] == top_card
deck.cards.size == 51

#Check that card is replaced to the bottom
deck.place_at_bottom(top_card)

deck.cards.last == top_card
deck.cards.first != top_card
deck.cards.size == 52

#Card tests
#=======================================
card_1 = Card.new("Diamonds", "Ace", 12)
card_2 = Card.new("Spades", "3", 1)

#Check for high card
(card_1.rank > card_2.rank) == true
(card_2.rank > card_1.rank) == false