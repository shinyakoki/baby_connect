class BabiesController < ApplicationController

  def index
    @babies = current_user.babies
    @baby = Baby.new
  end

  def new
    @baby = Baby.new
  end

  def show
    date = params[:date]&.to_date || Time.zone.today
    params[:date] = date
    return redirect_to baby_path if date > Time.zone.today
    @baby = Baby.find(params[:id])
    @records = @baby.records.where(date: date.beginning_of_day..date.end_of_day).order('date asc')
    @is_hidden = params[:date].nil? || date == Time.zone.today
  end

  def create
    @baby = Baby.new(baby_parameter)
    @baby.user_id = current_user.id
    @baby.save
    redirect_to babies_path
  end

  def destroy
    @baby = Baby.find(params[:id])
    @baby.destroy
    redirect_to babies_path
  end

  def edit
    @baby = Baby.find(params[:id])
  end

  def update
    if params[:commit] == "削除する"
      destroy
      return
    end
    @baby = Baby.find(params[:id])
    if @baby.update(baby_parameter)
      redirect_to babies_path
    else
      render 'edit'
    end
  end

  def new_record
    @baby = Baby.find(params[:id])
    @record = params[:format]
  end

  def create_record
    baby = Baby.find(params[:id])
    date = DateTime.parse(params[:user_record])
    time_parts = params[:date].split(':').map(&:to_i)
    # time_parts[0]=時 time_parts[1]=分 00=秒 +0900=タイムゾーンのオフセット
    new_date = DateTime.new(date.year, date.month, date.day, time_parts[0], time_parts[1], 00, "+0900")
    Record.create(item: params[:item], amount: params[:amount], date: new_date, unit: Record.units[:ml],baby_id: baby.id)
    redirect_to baby_path(id: baby.id, date: new_date)
  end

  def next_day
    date = params[:date]&.to_date || Time.zone.today
    # dateに1日を加算
    date += 1.days
    redirect_to "/babies/#{params[:id]}?date=#{date}"
  end

  def back_day
    date = params[:date]&.to_date || Time.zone.today
    # dateから1日を減算
    date -= 1.days
    redirect_to "/babies/#{params[:id]}?date=#{date}"
  end

  private

  def baby_parameter
    params.require(:baby).permit(:nickname, :sex, :date_of_birth)
  end
end