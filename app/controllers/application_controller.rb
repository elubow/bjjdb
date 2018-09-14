class ApplicationController < ActionController::Base
  include Pundit
  include Pagy::Backend
  protect_from_forgery
end
