class ApplicationController < ActionController::Base
    def get_user
        @user = User.find_by(remember_digest: User.digest(cookies.permanent[:remember_token]))
    end
    
    def signed_in_users
        unless signed_in?
            flash[:danger] = "Please log in."
            redirect_to sign_in_url
        end
    end
end
