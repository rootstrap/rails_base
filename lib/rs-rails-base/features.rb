module RailsBase
  # This module handle specific functionalities
  module Features
    def self.facebook
      Facebook.install
    end

    def self.chat
      Chat.install
    end

    def self.twilio
      Twilio.install
    end
  end
end
