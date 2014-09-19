module Display
  def self.introduction
    printf "Welcome\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?\n"
  end

  def self.enter
    printf 'Enter command: '
  end

  def self.enter_guess
    printf 'Enter Guess: '
  end

  def self.results
    puts 'Player Won/Lost'
  end

  def self.start
    puts "I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game."
  end

  def self.round_result(guess, elements, positions, count)
    puts "'#{guess}' has #{elements} of the correct elements with #{positions} in the correct positions.\nYou've taken #{count}"
  end

  def self.quit
    puts "Quitting..."
  end

end
