class Product < ApplicationRecord
  has_many :cart_items, dependent: :destroy   # 商品を消すとカート内のその商品も消える

  validates :name,  presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end