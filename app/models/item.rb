class Item < ApplicationRecord
  
  belongs_to :user
  has_one_attached :image
  
  with_options presence: true do
    validates :item_name
    validates :information
    validates :category_id
    validates :status_id
    validates :shipping_fee_id
    validates :prefecture_id
    validates :schedule_id
    validates :price
  end


end
