class OrdersController < ApplicationController

  before_filter :authenticate_user!

  def index

    @orders = current_user.orders

  end

  def create
    cart = ItemUser.where(user_id: current_user.id)
    # cart = current_user.item_users

    new_order = Order.new
    new_order.user_id = current_user.id
    new_order.save

    total = 0

    cart.each do |element|
      new_item_order = ItemOrder.new

      new_item_order.order_id = new_order.id
      new_item_order.item_id = element.item.id
      new_item_order.quantity = element.quantity
      new_item_order.price = element.item.price

      new_item_order.save

      total = total + new_item_order.price * new_item_order.quantity

    end

    new_order.total = total
    new_order.save

  cart.destroy_all

  redirect_to orders_path

  end

  def destroy
    order = Order.find params[:id]
    order.destroy
    redirect_to orders_path, notice: 'order deleted'
  end

end
