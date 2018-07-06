require 'commander/import'

module RailsBase
  # This module provides help to interact with client terminal
  module CliActions
    def say_something(message, style = 'BOLD')
      cli = HighLine.new
      cli.say("<%= color('#{message}', #{style}) %>")
    end

    def self.ask_for_something(ask)
      cli = HighLine.new
      cli.ask ask
    end
  end
end
