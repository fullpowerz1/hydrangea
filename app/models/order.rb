class Order < ApplicationRecord

  belongs_to :customers
  belongs_to :pictures

end
