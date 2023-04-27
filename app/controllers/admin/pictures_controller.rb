class Admin::PicturesController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def edit
    @ore = Ore.find(params[:id])
  end
end
