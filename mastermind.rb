Dir["./lib/*.rb"].each { |file| require file }

CLI.new.start_menu
