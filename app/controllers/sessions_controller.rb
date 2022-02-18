class SessionsController < ApplicationController
    def create
        @user = User.find_by(email: session_params[:email])
      
        if @user && @user.authenticate(session_params[:password])
          signin!
          render json: {
            signed_in: true,
            user: @user
          }
        else
          render json: { 
            status: 401,
            errors: ['no such user, please try again']
          }
        end
    end
    def is_signed_in?
        if signed_in? && current_user
          render json: {
            signed_in: true,
            user: current_user
          }
        else
          render json: {
            signed_in: false,
            message: 'no such user'
          }
        end
    end
    def destroy
          signout!
          render json: {
            status: 200,
            signed_out: true
          }
    end
    private
    def session_params
          params.require(:user).permit(:email, :password)
    end

    
end


