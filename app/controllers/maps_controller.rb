require "faraday"

class MapsController < ApplicationController
  def index
    # Get last activity for user
    access_token = cookies[:strava_access_token]
    res = Faraday.get("https://www.strava.com/api/v3/athlete/activities", nil, { "Authorization" => "Bearer #{access_token}" })
    puts res.body

    # Now we have the polyline and activity details, can show to the user and do transformation
  end
end
