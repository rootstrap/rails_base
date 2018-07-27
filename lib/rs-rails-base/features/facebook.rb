module RailsBase
  # This module handle specific functionalities
  module Features
    class Facebook
      extend RailsBase::FileManipulation
      extend RailsBase::CliActions

      def self.install
        templates_path = '../templates/facebook/'
        inject_files(templates_path)
        install_gem('koala', '3.0.0')
        create_file('spec/requests/api/v1/sessions/facebook_spec.rb',
                    "#{templates_path}facebook_spec.rb")
        create_file('app/services/facebook_service.rb',
                    "#{templates_path}facebook_service.rb")
        append_to_file('apiary.apib', "#{templates_path}apiary.apib")
        append_to_file('config/locales/en.yml', "#{templates_path}en.yml")
      end

      def self.inject_files(templates_path)
        inject_into_file('config/routes.rb', 'resource :user, only: :update do',
                         "#{templates_path}routes.rb")
        inject_into_file('app/controllers/api/v1/sessions_controller.rb',
                         "include Api::Concerns::ActAsApiRequest\n",
                         "#{templates_path}sessions_controller.rb", true)
        inject_into_file('app/controllers/api/v1/sessions_controller.rb',
                         "private\n",
                         "#{templates_path}sessions_controller_2.rb")
        inject_into_file('spec/factories/user.rb',
                         "number(10) }\n  end",
                         "#{templates_path}factories_user.rb")
        inject_into_file('spec/models/user_spec.rb',
                         "it { should validate_uniqueness_of(:uid).scoped_to(:provider) }\n",
                         "#{templates_path}user_spec.rb")
        inject_into_file('spec/routing/sessions_routing_spec.rb',
                         "sessions#create'\)\n    end",
                         "#{templates_path}sessions_routing_spec.rb")
      end
    end
  end
end
