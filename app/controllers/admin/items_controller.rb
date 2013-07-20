class Admin::ItemsController < ApplicationController

  layout 'admin'

  before_filter :authenticate_admin

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(params[:item].permit(:name, :description, :price, :category_id, :image))

    if @item.save
      redirect_to admin_items_path, notice: 'Item created successfully.'
    else
      render action: "new"
    end
  end

  def edit
    @item = Item.find params[:id]
  end

  def update
    @item = Item.find(params[:id])
    if @item.update_attributes(params[:item].permit(:name, :description, :price, :category_id, :image))
      redirect_to admin_items_path, notice: 'Item was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    item = Item.find params[:id]    #найти товар по его id
    item.destroy                    #уничтожить
    redirect_to admin_items_path, notice: 'item deleted'         #вернутся в список
  end

end
