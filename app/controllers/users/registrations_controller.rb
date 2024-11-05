class Users::RegistrationsController < Devise::RegistrationsController
    # You can customize the actions here
    before_action :configure_permitted_parameters
    # Override the create action
    def create
      super do |resource|
        # Custom behavior after user creation
      end
    end
  
    # Override the after_sign_up_path_for method if needed
    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name])
      end
    
    def after_sign_up_path_for(resource)
      # Redirect path after sign up
      super(resource)
    end
  end