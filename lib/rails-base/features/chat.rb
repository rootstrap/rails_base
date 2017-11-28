module RailsBase
  # This module handle specific functionalities
  module Features
    class Chat
      extend RailsBase::FileManipulation
      extend RailsBase::RailsActions
      extend RailsBase::CliActions

      def self.install
        templates_path = '../templates/chat/'
        migrations(templates_path)
        create_files(templates_path)
        create_spec_files(templates_path)
        inject_into_file('app/controllers/api/v1/sessions_controller.rb',
                         'include Concerns::ActAsApiRequest',
                         "#{templates_path}sessions_controller.rb")
      end

      def self.migrations(templates_path)
        new_migration(templates_path, 'add_chat.rb')
        new_migration(templates_path, 'add_participant.rb')
        new_migration(templates_path, 'add_message.rb')
        run_migrations
      end

      def self.create_files(templates_path)
        create_file('app/models/chat.rb', "#{templates_path}chat.rb")
        create_file('app/models/message.rb', "#{templates_path}message.rb")
        create_file('app/models/participant.rb', "#{templates_path}participant.rb")
        create_file('app/channels/application_cable/channel.rb',
                    "#{templates_path}channel.rb")
        create_file('app/channels/application_cable/connection.rb',
                    "#{templates_path}connection.rb")
        create_file('app/services/chat_service.rb',
                    "#{templates_path}chat_service.rb")
        create_file('app/channels/chat_channel.rb',
                    "#{templates_path}chat_channel.rb")
        create_file('app/controllers/api/v1/chats_controller.rb',
                    "#{templates_path}/chats_controller.rb")
      end

      def self.create_spec_files(templates_path)
        create_file('spec/models/chat.rb', "#{templates_path}chat_spec.rb")
        create_file('spec/models/participant.rb', "#{templates_path}participant_spec.rb")
        create_file('spec/models/message.rb', "#{templates_path}message.rb")
        create_file('spec/services/chat_service_spec.rb', "#{templates_path}chat_service_spec.rb")
        create_file('spec/factories/chat.rb', "#{templates_path}chat_factory.rb")
        create_file('spec/factories/participant.rb', "#{templates_path}participant_factory.rb")
        create_file('spec/factories/message.rb', "#{templates_path}message_factory.rb")
      end
    end
  end
end
