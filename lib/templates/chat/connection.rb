module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    private

    def find_verified_user
      if (current_user = find_user)
        current_user
      else
        reject_unauthorized_connection
      end
    end

    def find_user
      user_id = request.headers['HTTP_AUTHORIZATION'] || request.query_parameters['user'].to_i
      User.find_by(id: user_id)
    end
  end
end
