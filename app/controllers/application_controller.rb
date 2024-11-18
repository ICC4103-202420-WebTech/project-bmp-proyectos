class ApplicationController < ActionController::Base
    include CanCan::ControllerAdditions
    rescue_from CanCan::AccessDenied do |exception|
      redirect_to root_path,  alert: "You are not authorized to access this page."
    end
    before_action :authenticate_user!
end
