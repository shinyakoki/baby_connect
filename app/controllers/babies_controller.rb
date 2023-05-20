class BabiesController < ApplicationController

  def index
    # 保存されているデータ(タイプ)を全て取得
    @babies = Baby.all
    # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する
    @baby = Baby.new
  end

  def new
    # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する
    @baby = Baby.new
  end

  def show
    # params[:date]から値を取得し、Dateオブジェクトに変換してdate変数に代入
    # もしparams[:date]がnilでない場合は、to_dateメソッドでDateオブジェクトに変換
    # nilの場合は右側の式（Time.zone.today）が評価され、現在の日付が使用
    date = params[:date]&.to_date || Time.zone.today
    # もしdateが現在の日付よりも未来の日付であれば、baby_pathにリダイレクト
    return redirect_to baby_path if date > Time.zone.today
    # テーブルからレコードを1行取得。引数はid
    @baby = Baby.find(params[:id])
    # レコードを取得し、dateが指定した日付範囲内にあるものを@records変数に代入
    @records = @baby.records.where(date: date.beginning_of_day..date.end_of_day)
    # @is_hidden変数に、params[:date]がnilであるか、dateが現在の日付と同じであるかの論理値を代入
    @is_hidden = params[:date].nil? || date == Time.zone.today
  end

  def create
    # baby_parameter メソッドで必要な属性を取得し、その属性を持つ新しい赤ちゃんをデータベースに保存
    Baby.create(baby_parameter)
    # 赤ちゃんの作成が完了した後に一覧ページにリダイレクト
    redirect_to babies_path
  end

  def destroy
    # テーブルからレコードを1行取得。引数はid
    @baby = Baby.find(params[:id])
    #赤ちゃんを削除した時に
    @baby.destroy
    # 赤ちゃんの削除が完了した後に一覧ページにリダイレクト
    redirect_to babies_path
  end


  def edit
    # テーブルからレコードを1行取得。引数はid
    @baby = Baby.find(params[:id])
  end

  def update
    if params[:commit] == "削除する"
      destroy
      return
    end
    # テーブルからレコードを1行取得。引数はid
    @baby = Baby.find(params[:id])
    # もしアップデートに成功した時
    if @baby.update(baby_parameter)
      # 一覧ページにリダイレクト
      redirect_to babies_path
    else
      # elseの場合、編集ページを表示
      render 'edit'
    end
  end

  def new_record
    # テーブルからレコードを1行取得。引数はid
    @baby = Baby.find(params[:id])

  end

  def create_record
    # テーブルからレコードを1行取得。引数はid
    baby = Baby.find(params[:id])
    # Recordモデルの新しいインスタンスを作成し、各属性に対応する値を指定
    Record.create(item: params[:item], amount: params[:amount], date: params[:date], unit: Record.units[:ml],baby_id: baby.id)
    # 詳細ページにリダイレクト
    redirect_to baby_path(baby.id)
  end

  def next_day
    # params[:date]を取得し、to_dateメソッドで日付型に変換
    # params[:date]がnilの場合は、Time.zone.todayを使用
    date = params[:date]&.to_date || Time.zone.today
    # dateに1日を加算
    date += 1.days
    # "/babies/#{params[:id]}?date=#{date}"にリダイレクト
    # リダイレクト先のURLには、params[:id]と加算したdateが含まれる
    redirect_to "/babies/#{params[:id]}?date=#{date}"
  end

  def back_day
    # params[:date]を取得し、to_dateメソッドで日付型に変換
    # params[:date]がnilの場合は、Time.zone.todayを使用
    date = params[:date]&.to_date || Time.zone.today
    # dateから1日を減算します。
    date -= 1.days
    # "/babies/#{params[:id]}?date=#{date}"にリダイレクト
    # リダイレクト先のURLには、params[:id]と減算したdateが含まれる
    redirect_to "/babies/#{params[:id]}?date=#{date}"
  end


  private

  def baby_parameter
    # requireメソッドでオブジェクト名を指定,permitメソッドでキーを指定
    params.require(:baby).permit(:nickname, :sex, :date_of_birth)
  end
end
