# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  layout 'top'
  before_action :user_state, only: [:create]
  before_action :delete_guest_data, if: :guest_user?, only: :destroy

  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    super
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  # ゲストログイン機能
  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to parent_path(current_user.id)
  end

  # サインイン後にリダイレクト先を指定
  def after_sign_in_path_for(resource)
    parent_path(current_user.id)
  end

  # ゲストユーザーに関連するデータを削除する処理
  def delete_guest_data
    if current_user.email == 'guest@example.com'
      Baby.where(user_id: current_user.id).destroy_all
      Blog.destroy_all
    end
  end

  protected

  # 退会しているかを判断するメソッド
  def user_state
    @user = User.find_by(email: params[:user][:email])
    return if @user
    if @user.valid_password?(params[:user][:password]) && @user.is_deleted
      redirect_to new_user_registration_path
    end
  end
end