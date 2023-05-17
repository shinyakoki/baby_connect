class CalendarsController < ApplicationController

  def index
    # 保存されているデータ(カレンダー)を全て取得
    @calendar = Calendar.all
  end
end
