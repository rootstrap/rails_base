module RailsBase
  # This module handle specific functionalities
  module Features
    class Twilio
      extend RailsBase::FileManipulation
      extend RailsBase::CliActions

      def self.install
        templates_path = '../templates/twilio/'
        install_gem('twilio-ruby', '5.10.5')
        create_file('app/services/twilio_service.rb',
                    "#{templates_path}twilio_service.rb")
        create_file('config/initializers/twilio.rb',
                    "#{templates_path}twilio.rb")
      end
    end
  end
end
