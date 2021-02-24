module Api
  module V1
    module Auth
      class SessionsController < ApplicationController
        def create
          user = User.find_by!(username: user_params[:username])
          if user.authenticate(user_params[:password])
            payload  = { user_id: user.id }
            session = JWTSessions::Session.new(payload: payload, refresh_by_access_allowed: true)
            tokens = session.login
            response.set_cookie(JWTSessions.access_cookie,
                                value: tokens[:access],
                                httponly: true,
                                secure: Rails.env.production?)

            render json: { csrf: tokens[:csrf], data: current_user }
          else
            render json: { error: 'User was not found or was not logged in' }
            # not_authorized
          end
        end

        def destroy
          session = JWTSessions::Session.new(payload: payload)
          session.flush_by_access_payload
          render json: :ok
        end

        private

        def user_params
          params.permit(:username, :password)
        end

        def not_found
          render json: { error: 'Cannont find such email/password combination' }, status: :not_found
        end
      end
    end
  end
end
