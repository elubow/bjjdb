class ApplicationController < ActionController::Base
  include Devise::Controllers::Helpers
  
  helper_method :current_user
#  before_action :authenticate_user!
  

  include Pundit
  include Pagy::Backend
  protect_from_forgery
end
