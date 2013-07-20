class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    @item = Item.find params[:id]
    @comment = Comment.new item_id: @item.id
  end

end
