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
    validates :image
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :shipping_fee_id
    validates :prefecture_id
    validates :schedule_id
  end

  validates_inclusion_of :price, in:300..9999999, message: "Out of setting range"

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :schedule

end
