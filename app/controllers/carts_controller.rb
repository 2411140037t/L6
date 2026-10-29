class CartsController < ApplicationController
  def show
    @cart = current_cart   # URLのidに関係なく、自分のカートだけ表示する
    @cart_items = @cart.cart_items.includes(:product).order(:id)
  end
end