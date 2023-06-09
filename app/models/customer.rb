class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    has_many :orders, dependent: :destroy
    has_one_attached :profile_image

    # ユーザー用の画像を表示できるように
    def get_profile_image(width, height)
      unless profile_image.attached?
        file_path = Rails.root.join('app/assets/images/icon.jpg')
        profile_image.attach(io: File.open(file_path),filename: 'default-image.jpg', content_type: 'image/jpg')
      end
        profile_image.variant(resize_to_limit: [width, height]).processed
    end

end
