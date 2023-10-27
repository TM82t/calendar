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
    flash[:notice] = "投稿に成功しました"
    redirect_to events_path
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:alert] = "投稿削除しました"
    redirect_to events_path
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_parameter)
      flash[:notice] = "投稿を編集しました。"
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
