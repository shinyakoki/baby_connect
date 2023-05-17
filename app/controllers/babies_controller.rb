class BabiesController < ApplicationController
  def show
  end

  def index
  end

  def new
     @baby = Baby.new
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
