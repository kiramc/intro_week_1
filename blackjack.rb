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


def say(msg)
  puts "--> #{msg}"
end


def calculate_total(hand)
  
  array_of_faces = hand.map {|pair| pair[1]}
  total = 0

  array_of_faces.each do |face|
    if face == "A"
      total += 11
    elsif ["J", "Q", "K"].include?(face)
      total += 10
    else
      total += face.to_i
    end
  end

  # correct for aces
  array_of_faces.count{ |face| face == "A"}.times do
    total -= 10 if total > 21
  end

total
end

def show_cards(hand)
  hand.map{ |pair| "#{pair[1]}#{pair[0]}" }.join(", ")
end

# def hit(hand)
#   hand << deck.pop
# end

say "Welcome to blackjack. What's your name?"
players_name = gets.chomp

say "Great, nice to meet you #{players_name}. Let's get started."
say "I'll shuffle the cards....."

suits = %w(♣ ♥ ♠ ♦)
cards = %w(2 3 4 5 6 7 8 9 10 J Q K A)

deck = suits.product(cards)
deck = deck.shuffle!

# Dealing

players_hand = []
dealers_hand =[]

players_hand << deck.pop
dealers_hand << deck.pop
players_hand << deck.pop
dealers_hand << deck.pop

players_total = calculate_total(players_hand)
dealers_total = calculate_total(dealers_hand)

say "The dealer has: #{show_cards(dealers_hand)} for a total of #{dealers_total}"

say "You have: #{show_cards(players_hand)} for a total of #{players_total}."

# Player's turn

loop do
  break if players_total > 21
  if dealers_total == 21
    say "Whoa that's lucky! Dealer hit blackjack, game over."
    exit  
  elsif players_total == 21
    say "Blackjack! Congratulations, you win!"
    exit
  end

  if players_total > 21
    "Oh no! Looks like you busted, sorry. Maybe next time."
    exit
  else
    say "Do you want to 1) hit or 2) stay?"
    hit_or_stay = gets.chomp.to_i
      loop do
        break if hit_or_stay == 1 || hit_or_stay == 2
        puts "That's an invalid selection. Pick 1 to hit, 2 to stay."
        hit_or_stay = gets.chomp.to_i
      end
    if hit_or_stay == 1
      players_hand << deck.pop
      say "You chose hit, your new card is #{players_hand.last[1]}#{players_hand.last[0]}, for a total of #{calculate_total(players_hand)}."
    elsif hit_or_stay == 2
      players_total = calculate_total(players_hand)
      say "You chose to stay with a total of #{players_total}\n"
    end
  end
end


  


  # hit or stay

  
# Dealer's turn

# loop do
#   if dealers_total == 21








