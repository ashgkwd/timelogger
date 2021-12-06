class TimelogsController < ApplicationController
  def index
    @user = current_user
    @timelog = Timelog.ongoing_or_new(current_user)
    @button = @timelog.persisted? ? "Clock Out" : "Clock In"
    @timelogs = Timelog.order(clock_in: :desc).limit(100)
  end

  def show
    @user = current_user
    @timelog = Timelog.find(params[:id])
  end

  def create
    @timelog = Timelog.new
    @timelog.user = current_user
    @timelog.clock_in = Time.now

    if @timelog.save
      index
    else
      render :new
    end
  end

  def edit
  end

  def update
    @timelog = Timelog.find(params[:id])
    @timelog.clock_out = Time.now

    if @timelog.save
      index
    else
      render :edit
    end
  end
end
