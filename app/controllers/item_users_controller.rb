class ItemUsersController < ApplicationController

  before_filter :authenticate_user!

  def index
    @item_users = ItemUser.where(user_id: current_user.id)
  end

  def create
    @item_user = ItemUser.where(user_id: current_user.id).where(item_id: params[:item_id]).first

    if @item_user

      @item_user.quantity = @item_user.quantity + 1
      @item_user.save

    else
      @item_user = ItemUser.new
      @item_user.user_id = current_user.id
      @item_user.item_id = params[:item_id]
      @item_user.save
    end

  end


  def destroy
    item_user = ItemUser.find params[:id]

    if  item_user.user_id == current_user.id

      if item_user.quantity > 1

        item_user.quantity = item_user.quantity - 1
        item_user.save

      else
        item_user.destroy

      end

    end

    redirect_to item_users_path, notice: 'item removed'

  end

end
