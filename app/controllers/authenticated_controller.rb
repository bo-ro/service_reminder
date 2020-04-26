class AuthenticatedController < ApplicationController
  before_action :require_logged_in

  def require_logged_in
    redirect_to new_sessions_path if !current_user
  end
end
