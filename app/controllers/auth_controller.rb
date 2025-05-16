class AuthController < ApplicationController
  def index
    # TODO change localhost callback once this is deployed
    redirect_to "https://www.strava.com/oauth/authorize?client_id=#{Rails.application.credentials.strava.client_id}&redirect_uri=http://localhost:3000/callback&response_type=code&approval_prompt=auto&scope=read_all,activity:read_all", allow_other_host: true
  end
end
