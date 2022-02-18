class ApplicationController < ActionController::API
    skip_before_action :verify_authenticity_token
helper_method :signin!, :signed_in?, :current_user,     :authorized_user?, :signout!, :set_user
    
def signin!
      session[:user_id] = @user.id
end
def signed_in?
      !!session[:user_id]
end
def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
end
def authorized_user?
       @user == current_user
end

def signout!
    session.clear
end
def set_user
    @user = User.find_by(id: session[:user_id])
end 

end
