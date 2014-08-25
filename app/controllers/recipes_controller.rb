class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    @tags = Tag.all
    render('recipes/index.html.erb')
  end

  def new
    @recipe = Recipe.new(params[:recipe])
    @tags = Tag.all
    render('recipes/new.html.erb')
  end

  def create
    @recipe = Recipe.new(params[:recipe])
    if @recipe.save
      flash[:notice] = "Your recipe was added."
      if params[:tags]
        tags = params[:tags]
        tags.each do |tag|
          @recipe.tags << Tag.find(tag.to_i)
        end
      end
      redirect_to("/recipes/#{@recipe.id}")
    else
      render('recipes/new.html.erb')
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    render('recipes/show.html.erb')
  end

  def edit
    @recipe = Recipe.find(params[:id])
    render('recipes/edit.html.erb')
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(params[:recipe])
      flash[:notice] = "Your recipe was updated."
      redirect_to("/recipes/#{@recipe.id}")
    else
      render('recipes/edit.html.erb')
    end
    if params[:tag]
      tags = params[:tag]
      tags.each do |tag|
        @recipe.tags < tag
      end
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to("/")
  end
end
