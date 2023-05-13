class ParentsController < ApplicationController

  def new
    @parent = Parent.new
  end

  def shared
  end

  def registered
    @nickname = params[:nickname]
    @sex = params[:sex]
    @date_of_birth = params[:date_of_birth]
  end


  def create
    byebug
    parent = Parent.new(parent_params)
    if parent.save
      byebug
       redirect_to registered_parent_path(nickname: parent.nickname, sex: parent.sex, date_of_birth: parent.date_of_birth)
    else
    # 保存に失敗した場合の処理
    end
  end

  private
  # ストロングパラメータ
  def parent_params
    params.require(:parent).permit(:email, :password)
  end
end

