class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  helper_method :current_cart

  private

  # セッションに記録したカートを返す。なければ新しく作ってセッションにメモする
  def current_cart
    @current_cart ||= Cart.find_by(id: session[:cart_id])
    unless @current_cart
      @current_cart = Cart.create
      session[:cart_id] = @current_cart.id
    end
    @current_cart
  end
end