# user makes a choice
# computer makes a choice
# winner is displayed

VALID_CHOICES = ['rock', 'paper', 'scissors', 'lizard', 'spock']
choices_hash = { 'r' => 'rock',
                 'p' => 'paper',
                 'sc' => 'scissors',
                 'l' => 'lizard',
                 'sp' => 'spock' }

winners = { 'rock' => ['scissors', 'lizard'],
            'paper' => ['rock', 'spock'],
            'scissors' => ['paper', 'lizard'],
            'lizard' => ['spock', 'paper'],
            'spock' => ['rock', 'scissors'] }

def prompt(message)
  puts("=> #{message}")
end

def valid?(input)
  valid = { 'r' => 'rock',
            'p' => 'paper',
            'sc' => 'scissors',
            'l' => 'lizard',
            'sp' => 'spock' }

  if valid.key?(input.downcase)
    true
  else
    false
  end
end

loop do
  prompt("Welcome to Lizard Spock! First to 3 wins becomes the Grand Winner!!")
  player_wins = 0
  computer_wins = 0

  loop do
    choice = ''
    loop do
      prompt("Choose one: r) rock,
                          p) paper,
                          sc) scissors,
                          l) lizard,
                          sp) spock")
      choice = gets.chomp

      if valid?(choice)
        break
      else
        prompt("That's not a valid choice.")
      end
    end

    computer_choice = VALID_CHOICES.sample

    prompt("You chose #{choices_hash[choice.downcase]};
            computer chose #{computer_choice}")

    if winners[choices_hash[choice.downcase]].include?(computer_choice)
      player_wins += 1
      prompt("You win!")
    elsif winners[computer_choice].include?(choices_hash[choice.downcase])
      computer_wins += 1
      prompt("Computer wins!")
    else
      prompt("It's a draw!")
    end

    prompt("Player: #{player_wins}")
    prompt("Computer: #{computer_wins}")

    if player_wins == 3
      prompt("You are the Grand Winner!")
      break
    elsif computer_wins == 3 
      prompt("Computer is the Grand Winner! Better luck next time.")
      break
      end
    end
  end

  prompt("Would you like to play again?")
  play_again = gets.chomp
  break unless play_again.downcase.start_with?('y')
end

prompt("Thank you for playing. Good bye!")
