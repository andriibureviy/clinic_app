class CategoriesController < ApplicationController
  before_action :authenticate_user!

  before_action :set_category, only: [:show, :edit, :update, :destroy]

  # def index
  #   @categories = Category.includes(:doctors).all
  # end

  def index
    @categories = Category.all
  end

  def doctors
    @category = Category.find(params[:id])
    @doctors = @category.doctors
  end


  def show
  end

  def new
    @category = Category.new
  end

  def create
    # binding.pry
    category_attributes = params.require(:category).permit(:name, :doctor_id)
    @category = Category.new(category_attributes)
    if @category.save
      redirect_to root_path, notice: "Category created successfully"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to @category, notice: "Category was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_url, notice: "Category was successfully destroyed."
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :doctor_id)
  end
end
