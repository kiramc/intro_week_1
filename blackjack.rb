# 1. build a deck of cards
# 2. player gets dealt 2, dealer gets dealt 2, store dealers total
# 3. ask if player wants to hit or stay
#   - if player hits:
#       - if players total is > 21, player busts
#       - if players total == 21, player wins
#       - if plyers total < 21, repeat step 3
#   - if player stays, store players total then switch to dealers turn
# 4. check if dealer will hit or stay
#   - if dealer total is < 17, dealer hits
#     - if dealers new total < 17, dealer hits again
#     - if dealers total ==  21, dealer wins
#     - if dealers total > 21, dealer busts
#   - if dealer total is > 17, dealer stays
# 5. compare player and dealer totals
#   - if player total > dealer total, player wins, else dealer wins
#   - if player total == dealer total, it's a tie.
  
require 'pry'

def say(msg)
  puts "--> #{msg}"
end


# def calculate_total(cards)
#   get value from face of cards
#     if calculate_total(cards) > 10, ace is 1
#       if
#   add them up
# end


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

# players_total = calculate_total(players_cards)
# dealers_total = calculate_total(dealers_cards)

#First round



say "The dealer has: #{dealers_cards[0][1]}#{dealers_cards[0][0]}, #{dealers_cards[1][1]}#{dealers_cards[1][0]} for a total of "
#{players_total}"

say "You have: #{players_cards[0][1]}#{players_cards[0][0]}, #{players_cards[1][1]}#{players_cards[1][0]} for a total of "
#{players_total}.\n Do you want to 1) hit or 2) stay?"
hit_or_stay = gets.chomp











