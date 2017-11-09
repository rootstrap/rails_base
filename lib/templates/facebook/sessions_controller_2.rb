      def custom_sign_in
        sign_in(:api_v1_user, @resource)
        new_auth_header = @resource.create_new_auth_token
        # update response with the header that will be required by the next request
        response.headers.merge!(new_auth_header)
        render_create_success
      end
