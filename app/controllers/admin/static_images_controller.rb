class Admin::StaticImagesController < AdminController
  skip_before_filter :verify_authenticity_token
  skip_before_filter :authenticate_user!

  def create
    @image = StaticImage.new(image: params[:file])
    @image.save

    render 'create', layout: false
  end
end