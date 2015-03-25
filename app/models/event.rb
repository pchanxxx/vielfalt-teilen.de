class Event < ActiveRecord::Base
  attr_accessible :date_end, :date_start, :description, :location, :name, :published_at, :user_id, :all_day_start, :all_day_end

  belongs_to :user
end
