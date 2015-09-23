def say(msg)
  puts "---> #{msg}"
end

loop do

  say "Pick the first number"
  num1 = gets.chomp

  say "Pick the second number"
  num2 = gets.chomp

  say "Now what would you like to do with these? Pick:\n1: add, 2: subtract, 3: multiply, 4: divide"
  operator = gets.chomp.to_i

  until (1..4).include?(operator)
    say "That's not a valid selection! Choose from the above, 1-4."
    operator = gets.chomp.to_i
  end

  if operator == 1
    result = num1.to_i + num2.to_i
  elsif operator == 2
    result = num1.to_i - num2.to_i
  elsif operator == 3
    result = num1.to_i * num2.to_i
  elsif operator == 4
    result = num1.to_f / num2.to_f
  end

  say "You chose #{operator}. \nFirst number: #{num1} \n Second number: #{num2} \nThe answer is: #{result}"

  say "Would you like to do another calculation? (y/n)"
  calculate_again = gets.chomp

  break unless calculate_again == "y"
end