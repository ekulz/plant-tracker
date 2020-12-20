class SecuredController < ApplicationController
  include Secured

  def current_user
    @current_user
  end
end
