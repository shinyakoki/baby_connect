class ApplicationController < ActionController::Base
  
  # 現在のユーザーがゲストユーザーであるかどうかを判定するための処理
  def guest_user?
    current_user&.email == 'guest@example.com'
  end
end
