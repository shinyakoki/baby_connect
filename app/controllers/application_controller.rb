class ApplicationController < ActionController::Base

  def guest_user?
    # ログインしていないゲストユーザーかどうかを判定する処理を記述します
    current_user&.email == 'guest@example.com'
  end
end
