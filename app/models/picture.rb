class Picture < ApplicationRecord

  has_many :orders, dependent: :destroy
  has_one_attached :image

end
