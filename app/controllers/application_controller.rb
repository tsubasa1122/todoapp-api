class ApplicationController < ActionController::API
  skip_before_action :verify_authenticity_token, if: :devise_controller?
  include DeviseTokenAuth::Concerns::SetUserByToken
  protect_from_forgery with: :null_session
end
