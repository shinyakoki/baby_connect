class ParentsController < ApplicationController

  def new
    @parent = Parent.new
  end

  def shared
  end

  def create
    # １.&2. データを受け取り新規登録するためのインスタンス作成
    parent = Parent.new(parent_params)
    # 3. データをデータベースに保存するためのsaveメソッド実行
    parent.save
    # 4. XXX画面へリダイレクト
    redirect_to '/parents/shared'
  end

  private
  # ストロングパラメータ
  def parent_params
    params.require(:parent).permit(:email, :password)
  end
end

