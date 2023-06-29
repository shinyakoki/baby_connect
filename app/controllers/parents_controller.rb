class ParentsController < ApplicationController

  before_action :authenticate_user!

  def show
    @user = current_user
    @babies = current_user.babies
    @baby = Baby.new
  end


  def out
  end

  def timer
  end

  # 退会処理
  def withdraw
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  private

  def parent_params
    params.require(:parent).permit(:email, :password)
  end
end

