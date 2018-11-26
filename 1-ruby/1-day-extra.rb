random_number = rand(100)

begin
  puts "Guess a number!"
  
  guess = gets.to_i
  puts "You have provided #{guess}"  

  case
  when guess == random_number
    puts "You (finally) guessed correctly!"
  when guess < random_number
    puts "Too small!"
  when guess > random_number
    puts "Too big!"
  end
  
end while guess != random_number