class TagsController < ApplicationController
  def new
    @tag = Tag.new(params[:tag])
    render('tags/new.html.erb')
  end

  def create
    @tag = Tag.new(params[:tag])
    if @tag.save
      flash[:notice] = "Tag added"
      redirect_to("/tags/#{@tag.id}")
    else
      render('tags/new.html.erb')
    end
  end

  def show
    @tag = Tag.find(params[:id])
    render('tags/show.html.erb')
  end
end
