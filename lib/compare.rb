module Compare
  def self.guess(guess_sequence, final_sequence)
    elements = correct_elements(guess_sequence, final_sequence)
    positions = correct_positions(guess_sequence, final_sequence)
    results = {elements: elements, positions: positions, guess: guess_sequence}
  end
  def self.correct_positions(guess_sequence, final_sequence)
    correct = 0
    puts guess_sequence.split("")
    guess_sequence.length.times do |letter|
      correct += 1 if guess_sequence[letter] == final_sequence[letter]
    end
    correct
  end
  def self.correct_elements(guess_sequence, final_sequence)
    correct = 0
    final = final_sequence.split("")
    guess_sequence.split("").each do |x|
      if final.include?(x)
        correct += 1
        final.slice!(final.index(x))
      else
      end
    end
    correct
  end
end
