require 'fileutils'
require 'thor'
$thor_runner = true

module RailsBase
  # This module provides commands implementation
  module Commands
    def self.new_project
      RailsBase::Actions.say_something('Getting ready to get an amazing project')
      answer = RailsBase::Actions.ask_for_something('What would be the name for project folder?')
      if Dir.exist?(answer)
        RailsBase::Actions.say_something('Please dont use same project again and again')
      else
        final_version = manage_tags
        RailsBase::Actions.fetch_from_remote(final_version)
        clone_project(final_version, RailsBase::REMOTE_URI, answer)
        remove_git_configuration(answer)
      end
      RailsBase::Actions.say_something('Download complete')
    end

    def self.add_feature(feature)
      if feature.nil?
        display_menu
      else
        case feature
        when FEATURE_OPTIONS[:facebook]
          puts 'Mark is happy'
        when FEATURE_OPTIONS[:active_admin]
          puts 'simple...'
        when FEATURE_OPTIONS[:all]
          puts 'Oh you greedy one'
        else
          puts 'Please select a valid option'
        end
      end
    end

    def self.manage_tags
      filters = "awk '{print $2}'| cut -d '/' -f 3 | cut -d '^' -f 1 | uniq"
      tags = "git ls-remote -t #{RailsBase::REMOTE_URI} | #{filters}"
      reference_tag = RailsBase::API_BASE_VERSION
      tag_numbers = reference_tag.split('.')
      major = tag_numbers[0]
      minor = tag_numbers[2]
      `#{tags} | grep '#{major}.#{minor}.[0-9]' | tail -n 1 `
    end

    def self.clone_project(version, uri, to_folder)
      command = "git clone -b #{version.strip!} --depth 1 #{uri} #{to_folder}"
      system(command)
    end

    def self.remove_git_configuration(project_folder)
      git_config = project_folder + '/.git'
      FileUtils.rm_rf(git_config)
    end

    def self.display_menu
      RailsBase::Actions.say_something('FEATURE OPTIONS:')
      RailsBase::FEATURE_OPTIONS.each_value do |feature|
        RailsBase::Actions.say_something(" #{feature}")
      end
    end
  end
end
