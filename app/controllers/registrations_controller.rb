class RegistrationsController < ApplicationController
    def issue_token(payload)
        JWT.encode(payload, Rails.application.secrets.secret_key_base, "HS256")
    end

    def create 
        user = User.create!(user_params)

        if user 
            user_jwt = issue_token({id: user.id})
            cookies.signed[:jwt] = {value: user_jwt, httponly: true}
            puts cookies[:jwt]
            render json: {
                status: :created,
                logged_in: true,
                username: user.username
            }
        else
            render json: { status: 500 }
        end
    end

    private

    def user_params 
        params.require(:user).permit(:email, :username, :first_name, :last_name, :password)
    end
end
