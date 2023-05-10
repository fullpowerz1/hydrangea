class Admin::PicturesController < ApplicationController
  def index
    @pictures = Picture.all
  end

  def show
    @picture = Picture.find(params[:id])
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

  def update
    @picture = Picture.find(params[:id])
    @picture.update(picture_params)
    redirect_to admin_picture_path(@picture)
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to admin_pictures_path
  end

  private

  def picture_params
    params.require(:picture).permit(:name, :introduction, :price, :picture_image, :is_active)
  end

end
