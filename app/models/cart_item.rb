class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  validates :qty, numericality: { only_integer: true, greater_than: 0 }

  # 小計（価格 × 数量）
  def subtotal
    product.price * qty
  end
end