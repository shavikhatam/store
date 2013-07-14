class CategoriesController < ApplicationController

  before_filter :authenticate_user!, except: [:index, :show]

  # GET /categories
  # GET /categories.json

  def index
    @categories = Category.all
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    @category = Category.find(params[:id])
  end

  # GET /categories/new
  # GET /categories/new.json
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
    @category = Category.find(params[:id])
  end







  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(params[:category].permit(:name, :description))

      if @category.save
        redirect_to new_category_path, notice: 'Category was successfully created.'
      else
        render action: "new"
      end
    end









  # PUT /categories/1
  # PUT /categories/1.json
  def update
    @category = Category.find(params[:id])

      if @category.update_attributes(params[:category].permit(:name, :description))
        redirect_to @category, notice: 'Category was successfully updated.'

      else
        render action: "edit"
      end
  end











  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path, notice: 'Category deleted'

  end


  end