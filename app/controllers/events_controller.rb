class EventsController < ApplicationController
  def index
    @events = Event.all
    @event = Event.new
  end

  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
  end

  def create
    Event.create(event_parameter)
    flash[:notice] = "予定登録に成功しました"
    redirect_to events_path
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:alert] = "予定を削除しました"
    redirect_to events_path
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_parameter)
      flash[:notice] = "予定を編集しました。"
      redirect_to events_path
    else
      render 'edit'
    end
  end

  private

  def event_parameter
    params.require(:event).permit(:title, :content, :start_time)
  end
end
