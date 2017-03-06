require "byebug"

class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.find_or_create_by(recipe_params)

    params[:recipe][:ingredient_ids].each do |o|
      if o != ""

        @recipe.ingredients << Ingredient.find(o)
      end
    end

    @recipe.save
    redirect_to @recipe
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update

      @recipe = Recipe.find(params[:id])
      @recipe.update(recipe_params)
      @recipe.ingredients.clear
      params[:recipe][:ingredient_ids].each do |o|
        if o != ""
          @recipe.ingredients << Ingredient.find(o)
        end
      end

      redirect_to @recipe
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :ingredient_ids)
  end
end
