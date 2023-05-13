class ApplicationController < ActionController::Base
# device
# ユーザー登録（Signup)を行う前にconfigure_permitted_parametersメソッドを実行
 before_action :configure_permitted_parameters, if: :devise_controller?
# パラメータでニックネーム、性別、生年月日のデータ操作を許可
 def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,:sex,:date_of_birth])
 end

 # ログイン後に遷移先ページを指定するメソッド
  #  def after_sign_in_path_for(resource)
  # # ログイン後に遷移するpathを設定
  # # byebug
  # #    parents_registered_path(
  # #     nickname: resource.nickname,
  # #     sex: resource.sex,
  # #     date_of_birth: resource.date_of_birth
  # #     )
  #  end
  # ここまで
  # def after_sign_up_path_for(resource)
  # byebug
  #   parents_registered_path(
  #   nickname: resource.nickname,
  #   sex: resource.sex,
  #   date_of_birth: resource.date_of_birth
  #   )
  # end

end
