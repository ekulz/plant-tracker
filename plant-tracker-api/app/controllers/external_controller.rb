class ExternalController < SecuredController
  def show
    render json: { message: "Validated access token successfully" }
  end
end
