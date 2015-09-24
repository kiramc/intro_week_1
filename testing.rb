def say(msg)
  puts "--> #{msg}"
end


def show_cards(cards)
  (cards[0][1]).to_s (cards[0][0]).to_s
  (cards[1][1]).to_s (cards[1][0]).to_s
end





players_cards = [["♣", "10"], ["♦", "6"]]


say "Welcome to blackjack. What's your name?"
players_name = gets.chomp

say "Great, nice to meet you #{players_name}. Let's get started."
say "I'll shuffle the cards....."

suits = %w(♣ ♥ ♠ ♦)
cards = %w(2 3 4 5 6 7 8 9 10 J Q K A)

deck = suits.product(cards)
deck = deck.shuffle!


#Dealing

players_cards = []
dealers_cards =[]

players_cards << deck.pop
dealers_cards << deck.pop
players_cards << deck.pop
dealers_cards << deck.pop

p show_cards(players_cards)

