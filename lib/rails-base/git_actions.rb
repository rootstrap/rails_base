require 'commander/import'
require 'pathname'

module RailsBase
  # This module provides help to interact with git
  module GitActions
    extend RailsBase::CliActions

    def self.fetch_from_remote(version)
      say_something("Fetching api version ... #{version}")
    end
  end
end
