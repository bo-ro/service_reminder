class SessionsController < ApplicationController
  def destroy
    render :destroy, status: 401
  end
end
