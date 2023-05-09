class Picture < ApplicationRecord

  has_many :orders, dependent: :destroy
  has_one_attached :picture_image

  def get_picture_image(width, height)
    unless picture_image.attached?
      file_path = Rails.root.join('app/assets/images/icon.jpg')
      picture_image.attach(io: File.open(file_path),filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
      picture_image.variant(resize_to_limit: [width, height], gravity: :center).processed
  end
end
