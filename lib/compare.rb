module Compare
  def self.guess(guess_sequence, final_sequence)
    if guess_sequence == final_sequence
      puts "Match"
      true
    else
      puts "Not a match"
      false
    end
  end

end
