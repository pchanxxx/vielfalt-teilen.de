class Admin::EventsController < AdminController
  before_filter :find_model

  def index
    @events = Event.order('date_start ASC')
  end

  def new
    @event = Event.new
  end

  def edit

  end

  def create
    @event = Event.new(params[:event])
    if @event.save
      redirect_to admin_events_path, notice: 'Der Termin wurde erfolgreich gespeichert.'
    else
      render action: "new"
    end
  end

  def update
    if @event.update_attributes(params[:event])
      redirect_to admin_events_path, notice: 'Der Termin wurde erfolgreich gespeichert.'
    else
      render action: "edit"
    end
  end

  def destroy
    if @event.destroy
      redirect_to admin_events_path, notice: 'Der Termin wurde erfolgreich gelöscht.'
    else
      redirect_to admin_events_path, error: 'Der Termin konnte nicht gelöscht werden.'
    end
  end

  private

  def find_model
    @event = Event.find(params[:id]) if params[:id]
  end
end