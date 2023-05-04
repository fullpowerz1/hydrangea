class Admin::PicturesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
    if @picture.save
      redirect_to admin_picture_path(@picture)
    else
      redirect_to admin_pictures_path
    end
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  private

  def picture_params
    params.require(:picture).permit(:order_id, :name, :introduction, :price, :image, :is_active)
  end

end
