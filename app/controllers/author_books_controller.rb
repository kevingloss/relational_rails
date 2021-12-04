class AuthorBooksController < ApplicationController
  def index
    @author = Author.find(params[:author_id])
    @books = @author.books
  end

  def new
    @author = Author.find(params[:author_id])
  end

  def create
    author = Author.find(params[:author_id])
    author.books.create(books_param)

    redirect_to "/authors/#{author.id}/books"
  end

  private
  def books_param
    params.permit(:name, :rating, :read)
  end
end
