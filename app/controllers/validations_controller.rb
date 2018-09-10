class ValidationsController < ApplicationController
  def email
    if params[:email].size <= 5 or Devise.email_regexp.match(params[:email]).nil?
      render json: { valid: false, error: "Invalid email" }
    elsif User.find_by_email(params[:email])
      render json: { valid: false, error: "Email taken" }
    else
      render json: { valid: true }
    end
  end

  def url
    if params[:url].size <= 8
      render json: { valid: false }
    elsif Link.find_by_url(params[:url])
      render json: { valid: false }
    else
      render json: { valid: true }
    end
  end
end
