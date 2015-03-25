class AddAllDayToEvents < ActiveRecord::Migration
  def change
    add_column :events, :all_day_start, :boolean
    add_column :events, :all_day_end, :boolean
  end
end
