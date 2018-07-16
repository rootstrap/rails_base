module RailsBase
  # This module provides help to deal with rails migrations
  module RailsActions
    extend RailsBase::FileManipulation

    def new_migration(template_path, name)
      migration = next_migration_number
      create_file("db/migrate/#{migration}_#{name}",
                  "#{template_path}#{name}")
      sleep(0.1)
    end

    def run_migrations
      if File.exist?('config/database.yml')
        `rake db:migrate`
      else
        say_something('Please now create a database.yml file and run `rake db:migrate`')
      end
    end

    private

    def next_migration_number
      Time.now.utc.strftime('%Y%m%d%H%M%S%L')
    end
  end
end
