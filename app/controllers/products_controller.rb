class ProductsController < ApplicationController
  def index
    @products = Product.order(:id)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(name: params[:product][:name], price: params[:product][:price])
    if @product.save
      redirect_to products_path, notice: "商品を登録しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    Product.find(params[:id]).destroy
    redirect_to products_path, notice: "商品を削除しました"
  end
end