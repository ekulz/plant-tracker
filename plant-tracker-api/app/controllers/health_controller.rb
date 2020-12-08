class HealthController < ApplicationController
  def ping
    render json: { message: "Pong" }
  end
end
