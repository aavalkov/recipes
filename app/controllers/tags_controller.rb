class TagsController < ApplicationController
  def new
    @tag = Tag.new(params[:tag])
    render('tags/new.html.erb')
  end
end
