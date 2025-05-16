require "net/http"

class CallbackController < ApplicationController
  def index
    puts params["code"]
    token_uri = URI("https://www.strava.com/api/v3/oauth/token")
    token_params = { client_id: Rails.application.credentials.strava.client_id, client_secret: Rails.application.credentials.strava.client_secret, code: params["code"], grant_type: "authorization_code" }
    token_uri.query = URI.encode_www_form(token_params)
    res = Net::HTTP.post_form(token_uri, {})
    puts res.body


    cookies[:strava_access_token] = res.body["access_token"]
    cookies[:strava_refresh_token] = res.body["refresh_token"]

    # TODO test that the token stored in cookies is now working for subsequent api calls
  end
end
