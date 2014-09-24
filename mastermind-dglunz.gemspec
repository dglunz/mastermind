Gem::Specification.new do |s|
  s.name          = 'mastermind-dglunz'
  s.version       = '1.0.0'
  s.date          = '2014-08-23'
  s.summary       = "Mastermind in your terminal!"
  s.description   = "Classic Mastermind Game a la Ruby"
  s.authors       = ["Danny Glunz"]
  s.email         = 'dannyglunz@gmail.com'
  s.files         = %w[mastermind-dglunz.gemspec
                       README.md
                       bin/mastermind
                       lib/mastermind-dglunz/board.rb
                       lib/mastermind-dglunz/cli.rb
                       lib/mastermind-dglunz/color_sequence.rb
                       lib/mastermind-dglunz/display.rb
                       lib/mastermind-dglunz/game.rb]
  s.require_paths = ['lib/mastermind-dglunz/']
  s.homepage      = 'http://rubygems.org/gems/mastermind-dglunz'
  s.license       = 'MIT'
  s.executables   = 'mastermind'
end
