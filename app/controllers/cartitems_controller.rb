class CartitemsController < ApplicationController
  def new
    @product   = Product.find(params[:product_id])
    @cart_item = CartItem.new(product_id: @product.id, qty: 1)
  end

  def create
    @product = Product.find(params[:cart_item][:product_id])
    qty = params[:cart_item][:qty].to_i

    if qty < 1
      @cart_item = CartItem.new(product_id: @product.id, qty: 1)
      flash.now[:alert] = "数量は1以上にしてください"
      return render :new, status: :unprocessable_entity
    end

    # 同じ商品がもうカートにあれば数量を足す、なければ新しく入れる
    @cart_item = current_cart.cart_items.find_by(product_id: @product.id)
    if @cart_item
      @cart_item.qty += qty
    else
      @cart_item = current_cart.cart_items.new(product_id: @product.id, qty: qty)
    end

    if @cart_item.save
      redirect_to cart_path(current_cart), notice: "#{@product.name} をカートに追加しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    current_cart.cart_items.find(params[:id]).destroy   # 自分のカートの中身だけ消せる
    redirect_to cart_path(current_cart), notice: "カートから削除しました"
  end
end