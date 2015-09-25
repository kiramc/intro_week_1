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
  
  array_of_faces = cards.map {|pair| pair[1]}
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


return total

end

#Correct for aces

# def correct_for_aces(cards, total)
#   cards.each do
# end



p players_total = calculate_total(players_cards)
p dealers_total = calculate_total(dealers_cards)