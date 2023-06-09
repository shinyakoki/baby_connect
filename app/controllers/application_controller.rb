class ApplicationController < ActionController::Base

  def guest_user?
    current_user&.email == 'guest@example.com'
  end
end
