require 'commander/import'
require 'pathname'
require 'tty-file'

module RailsBase
  # This module provides help to file manipulation
  module FileManipulation
    extend RailsBase::CliActions

    def append_to_file(file_name, from)
      from_file = File.expand_path("#{__dir__}/#{from}")
      TTY::File.append_to_file(file_name, read_all_content(from_file))
    end

    def create_file(file_name, from)
      from_file = File.expand_path("#{__dir__}/#{from}")
      TTY::File.create_file(file_name, read_all_content(from_file))
    end

    def inject_into_file(file_name, after, from)
      from_file = File.expand_path("#{__dir__}/#{from}")
      content = "\n#{read_all_content(from_file)}"
      begin
        TTY::File.inject_into_file(file_name, content, after: after)
      rescue StandardError => ex
        say_something('Make sure you are on the root of your project please')
        puts ex
      end
    end

    def read_all_content(file_name)
      file = File.open(file_name, 'rb')
      content = file.read
      file.close
      content
    end

    def install_gem(name, version)
      if File.exist?('Gemfile')
        unless read_all_content('Gemfile').include? name
          gem_line = "gem '#{name}', '~> #{version}' \n"
          TTY::File.append_to_file('Gemfile', gem_line)
          system('bundle install')
        end
      else
        say_something('Please go to your root folder :)')
      end
    end
  end
end
