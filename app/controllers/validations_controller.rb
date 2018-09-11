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

  def instructor
    if params[:name].size <= 2
      render json: { valid: false, error: "Must be at least 2 characters" }
    elsif Instructor.find_by_name(params[:name])
      render json: { valid: false, error: "Name already taken" }
    else
      render json: { valid: true }
    end
  end

  def url
    if params[:url].size <= 8 or URI::regexp.match(params[:url]).nil?
      render json: { valid: false, error: "Invalid URL" }
    elsif Link.find_by_url(params[:url])
      render json: { valid: false, error: "We already have that video" }
    else
      render json: { valid: true }
    end
  end
end
