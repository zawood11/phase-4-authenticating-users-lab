class SessionsController < ApplicationController

    def create 
        user = User.find_by(username: params[:username])
        if user
            session[:user_id] = user.id
            render json: user
        else
            render json: { error: "No user found with this username." }, status: :not_found
        end
    end

    def destroy
        session.delete :user_id
        head :no_content
    end

end
