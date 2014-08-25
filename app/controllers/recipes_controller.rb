class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    render('recipes/index.html.erb')
  end

  def new
    @recipe = Recipe.new(params[:recipe])
    render('recipes/new.html.erb')
  end

  def create
    @recipe = Recipe.new(params[:recipe])
    if @recipe.save
      flash[:notice] = "Your recipe was added."
      redirect_to("/recipes/#{@recipe.id}")
    else
      render('recipes/new.html.erb')
    end
  end
end
