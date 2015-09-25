require "pry"

def say(msg)
  puts "--> #{msg}"
end


def show_cards(hand)
  hand.map { |pair| "#{pair[1]}#{pair[0]}" }.join(", ")
end

def say(msg)
  puts "--> #{msg}"
end

def hit(hand)
  hand << deck.pop
end

def calculate_total(hand)
  
  array_of_faces = hand.map {|pair| pair[1]}
  total = 0

  array_of_faces.each do |face|
    if face == "A"
      total += 11
    # capture J, Q, K
    elsif face.to_i == 0 
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



say "Welcome to blackjack. What's your name?"
players_name = gets.chomp

say "Great, nice to meet you #{players_name}. Let's get started."
say "I'll shuffle the cards....."

suits = %w(♣ ♥ ♠ ♦)
cards = %w(2 3 4 5 6 7 8 9 10 J Q K A)

deck = suits.product(cards)
deck = deck.shuffle!

#Dealing

players_hand = []
dealers_hand =[]

players_hand << deck.pop
dealers_hand << deck.pop
players_hand << deck.pop
dealers_hand << deck.pop

#First round

players_total = calculate_total(players_hand)
dealers_total = calculate_total(dealers_hand)

say "#{show_cards(players_hand)}"

# say "Dealer's cards: \n#{show_cards(dealers_hand)} Dealer has a total of: #{dealers_total}."


# say "Your cards: \n#{show_cards(players_hand)} You have a total of: #{players_total}."



