      def facebook
        user_params = FacebookService.new(params[:access_token]).profile
        @resource = User.from_social_provider 'facebook', user_params
        custom_sign_in
      rescue Koala::Facebook::AuthenticationError
        render json: { error: I18n.t('api.facebook.not_authorized') }, status: :forbidden
      rescue ActiveRecord::RecordNotUnique
        render json: { error: I18n.t('api.facebook.already_registerd') }, status: :bad_request
      end
