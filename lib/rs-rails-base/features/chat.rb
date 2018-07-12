module RailsBase
  # This module handle specific functionalities
  module Features
    class Chat
      extend RailsBase::FileManipulation
      extend RailsBase::RailsActions
      extend RailsBase::CliActions
      TEMPLATES_PATH = '../templates/chat/'.freeze
      VIEWS_PATH = 'app/views/api/v1/'.freeze

      def self.install
        install_gem('action-cable-testing', '0.3.1')
        migrations("#{TEMPLATES_PATH}migration-models/")
        create_files(TEMPLATES_PATH)
        create_jbuilder_files("#{TEMPLATES_PATH}jbuilder/")
        create_spec_files("#{TEMPLATES_PATH}specs/")
        inject_into_files(TEMPLATES_PATH)
        replace_in_files
      end

      def self.migrations(templates_path)
        new_migration(templates_path, 'add_chat.rb')
        new_migration(templates_path, 'add_participant.rb')
        new_migration(templates_path, 'add_message.rb')
        run_migrations
        create_file('app/models/chat.rb', "#{templates_path}chat.rb")
        create_file('app/models/message.rb', "#{templates_path}message.rb")
        create_file('app/models/participant.rb', "#{templates_path}participant.rb")
      end

      def self.create_files(templates_path)
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
        create_file('app/controllers/api/v1/messages_controller.rb',
                    "#{templates_path}/messages_controller.rb")
      end

      def self.create_spec_files(templates_path)
        create_file('spec/models/chat.rb', "#{templates_path}chat_spec.rb")
        create_file('spec/models/participant.rb', "#{templates_path}participant_spec.rb")
        create_file('spec/models/message.rb', "#{templates_path}message_spec.rb")
        create_file('spec/services/chat_service_spec.rb', "#{templates_path}chat_service_spec.rb")
        create_file('spec/factories/chat.rb', "#{templates_path}chat_factory.rb")
        create_file('spec/factories/participant.rb', "#{templates_path}participant_factory.rb")
        create_file('spec/factories/message.rb', "#{templates_path}message_factory.rb")
        create_file('spec/channels/chat_channel_spec.rb', "#{templates_path}chat_channel_spec.rb")
        create_file('spec/channels/connection_spec.rb', "#{templates_path}connection_spec.rb")
      end

      def self.create_jbuilder_files(templates_path)
        create_file("#{VIEWS_PATH}chats/index.json.jbuilder",
                    "#{templates_path}/index.json.jbuilder")
        create_file("#{VIEWS_PATH}chats/show.json.jbuilder",
                    "#{templates_path}/show.json.jbuilder")
        create_file("#{VIEWS_PATH}chats/_info.json.jbuilder",
                    "#{templates_path}/_info.json.jbuilder")
        create_file("#{VIEWS_PATH}chats/_message.json.jbuilder",
                    "#{templates_path}/_message.json.jbuilder")
        create_file("#{VIEWS_PATH}messages/_info.json.jbuilder",
                    "#{templates_path}/messages_create_info.json.jbuilder")
        create_file("#{VIEWS_PATH}messages/create.json.jbuilder",
                    "#{templates_path}/messages_create.json.jbuilder")
      end

      def self.inject_into_files(templates_path)
        inject_into_file('config/routes.rb', ":profile\n        end", "#{templates_path}routes.rb")
        inject_into_file('config/routes.rb', "    end\n  end", "#{templates_path}routes_2.rb")
        inject_into_file('app/models/user.rb', "include DeviseTokenAuth::Concerns::User\n",
                         "#{templates_path}migration-models/user.rb")
        inject_into_file('app/controllers/api/v1/sessions_controller.rb',
                         'include Api::Concerns::ActAsApiRequest',
                         "#{templates_path}sessions_controller.rb")
        inject_into_file('spec/rails_helper.rb', "require 'simplecov'",
                         "#{templates_path}specs/rails_helper.rb")
      end

      def self.replace_in_files
        replace_in_file('config/cable.yml', "test:\n  adapter: async",
                        "test:\n  adapter: test")
      end
    end
  end
end
