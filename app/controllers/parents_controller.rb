class ParentsController < ApplicationController

  def new

  end

  def show
    # テーブルからレコードを1行取得。引数はid
    # @baby = Baby.find(params[:id])
    @user = current_user
    @babies = current_user.babies
    # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する
    @baby = Baby.new
  end

  def index

  end

  # getメソッドでoutページを表示
  def out

  end

  # 退会処理
  def withdraw
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end


  def create

  end

  private
  # ストロングパラメータ
  def parent_params
    params.require(:parent).permit(:email, :password)
  end
end

