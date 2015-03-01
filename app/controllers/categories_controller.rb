class CategoriesController < ApplicationController

  def index
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params[:category].permit(:title, :color))
    if @category.save
      redirect_to categories_path
    else
      render 'new'
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])

    if @category.update(params[:category].permit(:title, :color))
      redirect_to categories_path
    else
      render 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    redirect_to categories_path
  end

end
