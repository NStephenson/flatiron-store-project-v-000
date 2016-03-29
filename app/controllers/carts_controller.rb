class CartsController < ApplicationController

  def show
    
  end

  def update
    
  end

  def checkout
    @cart = Cart.find(params[:id])
    @cart.update(status: 'submitted')

    @cart.line_items.each do |line_item|
      line_item.item.update(inventory: line_item.item.inventory - line_item.quantity)
    end

    current_user.current_cart = nil
    redirect_to cart_path(@cart)
  end


  def subtract_item
    current_user_cart.subtract_item(params[:item_id])
    current_user_cart.save
    redirect_to cart_path(current_user_cart)
  end

end
