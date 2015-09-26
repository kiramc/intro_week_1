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

say "The dealer has: #{show_cards(dealers_hand)} for a total of #{dealers_total}."

say "You have: #{show_cards(players_hand)} for a total of #{players_total}."

if dealers_total == 21
  say "Whoa that's lucky! Dealer hit blackjack, sorry. Game over."
  exit  
elsif players_total == 21
  say "Whoa that's lucky! You hit blackjack! Congratulations, you win!"
  exit
end

# Player's turn

while players_total < 21
  say "Do you want to 1) hit or 2) stay?"
  hit_or_stay = gets.chomp.to_i
  loop do
    break if hit_or_stay == 1 || hit_or_stay == 2
    puts "That's an invalid selection. Pick 1 to hit, 2 to stay."
    hit_or_stay = gets.chomp.to_i
  end

  # hit

  if hit_or_stay == 1
    players_hand << deck.pop
    players_total = calculate_total(players_hand)
    say "You chose hit, your new card is #{players_hand.last[1]}#{players_hand.last[0]}, for a total of #{players_total}."
    if players_total == 21
      say "Blackjack! Congratulations, you win."
      exit
    elsif players_total > 21
      say "Oh no! Looks like you busted, sorry. Maybe next time."
      exit
    end
  elsif hit_or_stay == 2
    say "You chose to stay with a total of #{calculate_total(players_hand)}."
    break
  end  
end

# Dealer's turn

say "Now it's the dealer's turn." if dealers_total < 17

while dealers_total < 17
  say "Dealing the dealer another card....."
  dealers_hand << deck.pop
  dealers_total = calculate_total(dealers_hand)
  say "Dealer's new card is #{dealers_hand.last[1]}#{dealers_hand.last[0]}, for a total of #{dealers_total}."
  if dealers_total == 21
    say "Oh no! Dealer hit blackjack, sorry. Game over."
    exit
  elsif dealers_total > 21
    say "Dealers busts! Congratulations, you win."
    exit
  end
end

# Compare hands

say "Dealer's hand: #{show_cards(dealers_hand)}."
say "Your hand: #{show_cards(players_hand)}."

if players_total > dealers_total
  say "Congratulations! You win."
elsif players_total < dealers_total
  say "Oh no, looks like dealer wins. Maybe next time."
else
  say "It's a tie!"
end








