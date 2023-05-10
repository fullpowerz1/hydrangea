class Public::PicturesController < ApplicationController
  def index
    @pictures = Picture.all.page(params[:page]).per(10)
  end

  def show
  end

end
