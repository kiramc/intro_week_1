
# 1. label spots
# 2. ask player to pick a spot
# 3. computer picks a spot
# 4. repeat until someone gets 3 in a row
# bonus: try to get the computer to prefer to win


puts "Hi there! Welcome to tic tac toe. \n
This is the game board: \n\n
          |         |\n      
     1    |    2    |    3\n
          |         |\n
----------+---------+---------\n
          |         |\n       
     4    |    5    |    6\n     
          |         |\n   
----------+---------+---------\n
          |         |\n
     7    |    8    |    9\n
          |         |\n\n"

def initialize_board
  board = {}
  (1..9).each { |position| board[position] = " "}
  board
end

def draw_board(b)
  system "clear"
  puts "          |         |\n      
     #{b[1]}    |    #{b[2]}    |    #{b[3]}\n
          |         |\n
----------+---------+---------\n
          |         |\n       
     #{b[4]}    |    #{b[5]}    |    #{b[6]}\n     
          |         |\n   
----------+---------+---------\n
          |         |\n
     #{b[7]}    |    #{b[8]}    |    #{b[9]}\n
          |         |\n\n"
end

def player_picks(b)
  puts "Pick a position (1 - 9):"
  player_position = gets.chomp.to_i
  loop do
    puts "That's an invalid selection! Pick again."
    player_position = gets.chomp.to_i
    break if empty_positions(b).include?(player_position)
  end
    b[player_position] = "X"
    draw_board(b)
end

def empty_positions(b)
  b.keys.select { |position| b[position] == " "}
end

def computer_picks(b)
  position = empty_positions(b).sample
  b[position] = "O"
  draw_board(b)
end

def check_for_winner(b)
  winning_lines = [[1,2,3], [4,5,6], [7,8,9], 
    [1,4,7], [2,5,8], [3,6,9], 
    [1,5,9], [3,5,7]]
  winning_lines.each do |line|
    return "Player" if b.values_at(*line).count("X") == 3
    return "Computer" if b.values_at(*line).count("O") == 3
  end
  nil
end

board = initialize_board
winner = ""
loop do
  player_picks(board)
  computer_picks(board)
  check_for_winner(board)
  break if check_for_winner(board) || empty_positions(board).empty?
end

if winner
  puts "#{check_for_winner(board)} wins!"
else
  puts "It's a tie!"
end

