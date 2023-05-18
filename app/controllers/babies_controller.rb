class BabiesController < ApplicationController
  def show
   @baby = Baby.find(params[:id])
  end

  def index
  end

  def new
     @baby = Baby.new
  end

  def create
    # blog_parameter メソッドで必要な属性を取得し、その属性を持つ新しいブログ記事をデータベースに保存する。
    Baby.create(baby_parameter)
    # ブログ記事の作成が完了した後に一覧ページにリダイレクト
    redirect_to babies_path
  end

  def edit
    # テーブルからレコードを1行取得。引数はid
    # @baby = Baby.find(params[:id])
  end









  private

  def baby_parameter
    # requireメソッドでオブジェクト名を指定,permitメソッドでキーを指定
    params.require(:baby).permit(:nickname, :sex, :date_of_birth)
  end
end
