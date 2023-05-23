class ApplicationController < ActionController::Base
   before_action :delete_guest_data, if: :guest_user?, only: :destroy

  private

  def delete_guest_data
    if current_user.email == 'guest@example.com'
    Baby.where(user_id: current_user.id).destroy_all
    Blog.destroy_all
    end
  end

  def guest_user?
    # ログインしていないゲストユーザーかどうかを判定する処理を記述します
    current_user&.email == 'guest@example.com'
  end
end
