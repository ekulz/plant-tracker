class ExternalController < ApplicationController
  include Secured

  def show
    render json: { message: "Validated access token successfully" }
  end
end
