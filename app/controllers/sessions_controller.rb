class SessionsController < Devise::SessionsController
    before_action :redirect_if_authenticated, only: [:new]
  
    private
  
    # Redirects authenticated users trying to access the login page
    def redirect_if_authenticated
      if user_signed_in?
        redirect_to after_sign_in_path_for(current_user)
      end
    end
  end
  