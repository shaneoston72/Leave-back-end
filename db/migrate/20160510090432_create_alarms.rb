class CreateAlarms < ActiveRecord::Migration
  def change
    create_table :alarms do |t|
      t.string :from_station
      t.string :to_station
      t.string :arrival_time
      t.string :alarm_offset

      t.timestamps null: false
    end
  end
end
