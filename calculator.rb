require 'pry'

def say(msg)
  puts "---> #{msg}"
end

say "Pick the first number"
num1 = gets.chomp

say "Pick the second number"
num2 = gets.chomp

say "Now what would you like to do with these? Pick:\n1: add, 2: subtract, 3: multiply, 4: divide"
operator = gets.chomp.to_i

while operator > 4 || operator == 0 do
  say "That's not a valid selection! Choose from the above, from 1-4."
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