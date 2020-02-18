class Api::ApplicationController < ApplicationController
  before_action :get_auth_params, :set_current_user

  private

  def get_auth_params
    @token = request.headers['access-token']
    @uid = request.headers['uid']
    @client = request.headers['client']
  end

  def set_current_user
    @current_user = User.find_by(uid: @uid)
    @current_user && @current_user.valid_token?(@token, @client) ? @current_user : nil
  end
end
