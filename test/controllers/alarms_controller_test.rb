require 'test_helper'

class AlarmsControllerTest < ActionController::TestCase
  setup do
    @alarm = alarms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:alarms)
  end

  test "should create alarm" do
    assert_difference('Alarm.count') do
      post :create, alarm: { alarm_offset: @alarm.alarm_offset, arrival_time: @alarm.arrival_time, from_station: @alarm.from_station, to_station: @alarm.to_station }
    end

    assert_response 201
  end

  test "should show alarm" do
    get :show, id: @alarm
    assert_response :success
  end

  test "should update alarm" do
    put :update, id: @alarm, alarm: { alarm_offset: @alarm.alarm_offset, arrival_time: @alarm.arrival_time, from_station: @alarm.from_station, to_station: @alarm.to_station }
    assert_response 204
  end

  test "should destroy alarm" do
    assert_difference('Alarm.count', -1) do
      delete :destroy, id: @alarm
    end

    assert_response 204
  end
end
