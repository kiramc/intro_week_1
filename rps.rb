# user picks r/p/s
# computer randomly generates r/p/s
# user wins if: **put winning cases**
# else, computer wins
# display winning message, ask to play again

# 1. player picks either rock, paper, or scissors
# 2. compare paper > rock, rock > scissors, scissors > paper, or tie if same

CHOICES = { "p" => "paper", "s" => "scissors", "r" => "rock" }

puts "Welcome to rock, paper, scissors!"

def display_winning_msg(choice)
  case choice
  when "r"
    puts "Rock smashes scissors."
  when "p"
    puts "Paper covers rock."
  when "s"
    puts "Scissors shred paper."
  end
end

loop do
  
  puts "Pick one: rock (r), paper (p), or scissors (s)"
  player_choice = nil

  loop do
    player_choice = gets.chomp.downcase
    if CHOICES.keys.include?(player_choice)
    puts "You chose #{CHOICES[player_choice]}."
    break
    else
      puts "That is not a valid selection!"
    end
  end

  computer_choice = CHOICES.keys.sample
  puts "The computer chose #{CHOICES[computer_choice]}."

  if player_choice == computer_choice
    puts "It's a tie!"
  elsif (player_choice == "r" && computer_choice == "s") ||
    (player_choice == "p" && computer_choice == "r") ||
    (player_choice == "s" && computer_choice == "p")
    display_winning_msg(player_choice)
    puts "You win!"
  else
    display_winning_msg(computer_choice)
    puts "Computer wins!"
  end

  puts "Want to play again? (put y/n)"
  break if gets.chomp.downcase != "y"

end

puts "Thanks for playing! Goodbye."

