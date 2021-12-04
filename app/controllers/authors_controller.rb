class AuthorsController < ApplicationController
  def index
    @authors = Author.all
  end

  def show
    @author = Author.find(params[:id])
  end

  def new
  end

  def create
    author = Author.create(author_params)
    redirect_to "/authors"
  end

private
  def author_params
    params.permit(:name, :age, :alive)
  end
end
