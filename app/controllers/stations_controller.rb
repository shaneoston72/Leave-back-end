require_relative '../../lib/station_list'

class StationsController < ApplicationController

  def show
   station_list_call = StationList.new
   station_list = station_list_call.station_list
   render :json => station_list
 end

end
