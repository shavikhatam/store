class ItemUsersController < ApplicationController

  def index
    @item_users = ItemUser.where(user_id: current_user.id)
  end

  def create
    @item_user = ItemUser.new
    @item_user.user_id = current_user.id
    @item_user.item_id = params[:item_id]
    @item_user.save
  end

  def destroy
    item_user = ItemUser.find params[:id]
    item_user.destroy
    redirect_to item_users_path, notice: 'item removed'
  end

end
