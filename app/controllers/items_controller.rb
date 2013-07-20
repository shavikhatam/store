class ItemsController < ApplicationController

  before_filter :authenticate_user!, except: [:index, :show]

  #GET: список товаров
  def index
    @items = Item.all
  end

  #GET: форма создания
  def new
   @item = Item.new
  end

  #POST: процесс создания
  def create
    @item = Item.new(params[:item].permit(:name, :description, :price, :category_id, :image))

    if @item.save
      redirect_to items_path, notice: 'Item created successfully.'
    else
      render action: "new"
    end
  end

  #GET: форма редактирвания
  def edit
      @item = Item.find params[:id]
  end

  #PUT: процесс обновления
  def update
    @item = Item.find(params[:id])
    if @item.update_attributes(params[:item].permit(:name, :description, :price, :category_id, :image))
      redirect_to @item, notice: 'Item was successfully updated.'
    else
      render action: "edit"
    end
  end

  #GET: просмотр
  def show
    @item = Item.find params[:id]
    @comment = Comment.new item_id: @item.id
  end

  #DELETE: удаление
  def destroy
    item = Item.find params[:id]    #найти товар по его id
    item.destroy                    #уничтожить
    redirect_to items_path, notice: 'item deleted'         #вернутся в список
  end

end
