require 'rails/generators'
require 'rails/generators/rails/app/app_generator'
require 'thor'

module RailsBase
  include RailsBase::Actions

  class AppBuilder < Rails::Generators::AppGenerator

    def init
      puts "Adding seed"
      directory "app", "app"
    end
  end
end
