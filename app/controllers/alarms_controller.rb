class AlarmsController < ApplicationController
  before_action :set_alarm, only: [:show, :update, :destroy]

  # GET /alarms
  # GET /alarms.json
  def index
    @alarms = Alarm.all

    render json: @alarms
  end

  # GET /alarms/1
  # GET /alarms/1.json
  def show
    render json: @alarm
  end

  # POST /alarms
  # POST /alarms.json
  def create
    @alarm = Alarm.new(alarm_params)

    if @alarm.save
      render json: @alarm, status: :created, location: @alarm
    else
      render json: @alarm.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /alarms/1
  # PATCH/PUT /alarms/1.json
  def update
    @alarm = Alarm.find(params[:id])

    if @alarm.update(alarm_params)
      head :no_content
    else
      render json: @alarm.errors, status: :unprocessable_entity
    end
  end

  # DELETE /alarms/1
  # DELETE /alarms/1.json
  def destroy
    @alarm.destroy

    head :no_content
  end

  private

    def set_alarm
      @alarm = Alarm.find(params[:id])
    end

    def alarm_params
      params.require(:alarm).permit(:from_station, :to_station, :arrival_time, :alarm_offset)
    end
end
