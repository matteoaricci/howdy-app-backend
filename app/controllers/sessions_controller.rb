class SessionsController < ApplicationController
    include CurrentUserConcern
    
    def issue_token(payload)
        JWT.encode(payload, Rails.application.secrets.secret_key_base, "HS256")
    end

    def create
        user = User
                .find_by(username: params["user"]["username"])
                .try(:authenticate, params["user"]["password"])

        if user 
            # session[:user_id] = user.id
            user_jwt = issue_token({id: user.id})
            cookies.signed[:jwt] = {value: user_jwt, httponly: true}
            render json: {
                status: :created,
                logged_in: true,
                username: user.username
            }
        else
            render json: { status: 401 }
        end
    end

    def logged_in
        if @current_user 
            render json: {
                logged_in: true,
                user: @current_user
            }
        else
            render json: { logged_in: false }
        end
    end

    def logout
        cookies.delete :jwt 
        render json: {logged_in: false}
    end
end
