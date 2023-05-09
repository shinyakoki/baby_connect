class ApplicationController < ActionController::Base
# device
# ログイン後に遷移先ページを指定するメソッド
def after_sign_in_path_for(resource)
# ログイン後に遷移するpathを設定
    baby_path(resource)
end
# ここまで

end
