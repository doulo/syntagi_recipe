class RecipesController < ApplicationController
  before_action :find_recipe, only: [:show, :update, :edit, :destroy]

  def index
    @recipe = Recipe.all
  end

  def show
  end

  def new
    @recipe = current_user.recipes.build
  end

  def create
    @recipe = current_user.recipes.build(recipe_param)
    if @recipe.save
      redirect_to @recipe
    else
      redirect_to 'new'
    end
  end

  def update
    if @recipe.update(recipe_param)
      redirect_to @recipe
    else
      redirect_to 'edit'
    end
  end

  def edit
  end

  def destroy
    @recipe.destroy
    redirect_to root_path
  end

  private
  def recipe_param
    params.require(:recipe).permit(:name, :description, :image, ingredients_attributes: [:id, :name, :_destroy],
      directions_attributes: [:id, :step, :_destroy])
  end

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end
end
