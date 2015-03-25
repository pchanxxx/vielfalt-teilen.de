class EventsController < ApplicationController
  def index
    @events = Event.where('date_start >= ?', Time.now).order('date_start ASC').page(params[:page])
  end
end