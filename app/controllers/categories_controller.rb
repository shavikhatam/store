class CategoriesController < ApplicationController

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

  end