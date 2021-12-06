class AuthorBooksController < ApplicationController
  def index
    @author = Author.find(params[:author_id])
    if params[:sort]
      @books = @author.alphabetize
    else
      @books = @author.books
    end
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
