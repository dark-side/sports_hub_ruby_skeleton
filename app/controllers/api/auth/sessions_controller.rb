module Api
  module Auth
    class SessionsController < Devise::SessionsController
      respond_to :json
      skip_before_action :verify_authenticity_token
      skip_before_action :verify_signed_out_user, only: :destroy

      def destroy
        if current_user
          sign_out(current_user)
          render json: { message: 'Signed out successfully' }, status: :ok
        else
          render json: { error: 'User not signed in' }, status: :unauthorized
        end
      end

      private

      def respond_with(resource, _opts = {})
        render json: { authentication_token: current_token, user: resource }
      end

      def respond_to_on_destroy
        head :no_content
      end

      def json_request?
        request.format.json? || request.content_type == 'application/json'
      end

      def current_token
        request.env['warden-jwt_auth.token']
      end
    end
  end
end