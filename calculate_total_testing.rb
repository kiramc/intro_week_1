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

p players_cards
p dealers_cards


def calculate_total(cards)
  
  total = 0

  cards.each do |pair|
    if pair[1] == "A"
      if total < 11
        total += 11
      else
        total += 1
      end
    elsif pair[1].to_i == 0
      total += 10
    else
      total += pair[1].to_i
    end
  end

return total

end

#Correct for aces




p calculate_total(players_cards)
p calculate_total(dealers_cards)