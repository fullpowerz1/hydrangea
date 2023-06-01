class Public::PicturesController < ApplicationController
  def index
    @pictures = Picture.all.page(params[:page]).per(8)

    # logger.debug メソッドの設定
    # @pictures.each do |picture|
    #   logger.debug("Picture path: #{picture.image.service_url}") # 画像のパスをログに出力するコード
    # end

  end

  def show
  end

end
