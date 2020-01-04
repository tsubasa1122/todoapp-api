class Api::ApplicationController < ApplicationController
  skip_before_action :verify_authenticity_token, if: :devise_controller?
  include DeviseTokenAuth::Concerns::SetUserByToken
end
