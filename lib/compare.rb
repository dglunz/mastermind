module Compare
  def self.guess(guess_sequence, final_sequence)
    elements = correct_elements(guess_sequence, final_sequence)    # => 2
    positions = correct_positions(guess_sequence, final_sequence)  # => 0
    results = {elements: elements, positions: positions, guess: guess_sequence}           # => {:elements=>2, :positions=>0}
  end
  def self.correct_positions(guess_sequence, final_sequence)
    0                                                              # => 0
  end
  def self.correct_elements(guess_sequence, final_sequence)
    correct = 0                                                    # => 0
    final = final_sequence.split("")                               # => ["r", "r", "g", "g"]
    guess_sequence.split("").each do |x|                           # => ["g", "g", "g", "g"]
      if final.include?(x)                                         # => true, true, false, false
        correct += 1                                               # => 1, 2
        final.slice!(final.index(x))                               # => "g", "g"
      else
      end                                                          # => "g", "g", nil, nil
    end                                                            # => ["g", "g", "g", "g"]
    correct                                                        # => 2
  end
end

Compare.guess("gggg", "rrgg")  # => {:elements=>2, :positions=>0}
