class ColorSequence
  attr_reader :colors                                        # => nil
  def initialize(colors=random)
    @colors = colors
  end
  def random(size=4)
    @colors = ''
    available_colors = ['r','g','b','y','w','b']
    size.times { @colors << available_colors[0..3].sample }
    @colors
  end
end
