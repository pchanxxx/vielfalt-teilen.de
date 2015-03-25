class ZeichensController < ApplicationController
  layout :false

  def index
    @zeichens = Zeichen.where(published: true).order('created_at DESC').page(params[:page]).per(12)

    @zeichen = Zeichen.new

    if (Zeichen.count / 12.0) > (params[:page].to_i || 1)
      @next_page = (params[:page].to_i || 1) + 1
    else
      @next_page = nil
    end
  end

  def create
    @zeichen = Zeichen.new(params[:zeichen])
    if @zeichen.save
      render
    else
      render json: { error: 'An error occured.' }
    end
  end
end
