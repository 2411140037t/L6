class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :products, through: :cart_items

  # 合計金額
  def total_price
    cart_items.sum { |item| item.subtotal }
  end
end