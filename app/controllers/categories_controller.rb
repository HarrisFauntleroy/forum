# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]

  def index
    @categories = Category.all.includes(:forums)
  end

  def new
    @category = Category.new(user: current_user)
    authorize @category
  end

  def create
    @category = Category.new(category_params)
    authorize @category

    if @category.save
      redirect_to forums_path, notice: 'Category created!'
    else
      flash.now[:error] = 'Category could not be created.'
      render :new
    end
  end

  def update
    if @category.update(category_params)
      redirect_to forums_path, notice: 'category updated!'
    else
      render :edit
    end
  end

  def destroy
    authorize @category
    @category.destroy

    redirect_to forums_path, notice: 'Category deleted!'
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :id)
  end
end
