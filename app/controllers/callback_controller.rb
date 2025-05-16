require "net/http"
require "json"

class CallbackController < ApplicationController
  def index
    conn = Faraday.new(
      url: "https://www.strava.com",
      params: { client_id: Rails.application.credentials.strava.client_id, client_secret: Rails.application.credentials.strava.client_secret, code: params["code"], grant_type: "authorization_code" },
    )
    res = conn.post("/api/v3/oauth/token")
    body = JSON.parse(res.body)
    cookies[:strava_access_token] = body["access_token"]
    cookies[:strava_refresh_token] = body["refresh_token"]
  end
end
