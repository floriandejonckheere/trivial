# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index; end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to categories_path
    else
      render "new"
    end
  end

  def edit
    @category = category
  end

  def update
    @category = category

    if @category.update(category_params)
      redirect_to categories_path
    else
      render "edit"
    end
  end

  def destroy
    @category = category
    @category.destroy

    redirect_to categories_path
  end

  private

  def category_params
    params
      .require(:category)
      .permit(:title, :color)
  end

  def category
    @category ||= Category.find(params[:id])
  end
end
