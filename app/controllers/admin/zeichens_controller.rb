class Admin::ZeichensController < AdminController
  before_filter :find_model

  def index
    @zeichens = Zeichen.order('created_at DESC')
  end

  def update
    if @zeichen.update_attribute(:published, true)
      redirect_to admin_zeichens_path, notice: 'Der Eintrag wurde erfolgreich veröffentlicht.'
    else
      redirect_to admin_zeichens_path, error: 'Der Eintrag konnte nicht veröffentlicht werden.'
    end
  end

  def destroy
    if @zeichen.destroy
      redirect_to admin_zeichens_path, notice: 'Der Eintrag wurde erfolgreich gelöscht.'
    else
      redirect_to admin_zeichens_path, error: 'Der Eintrag konnte nicht gelöscht werden.'
    end
  end

  private

  def find_model
    @zeichen = Zeichen.find(params[:id]) if params[:id]
  end
end