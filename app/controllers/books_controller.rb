class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :check_authorization

  before_action :set_book, only: %i[show edit update destroy]
  before_action :set_authors_and_genres, only: %i[new edit create]

  def new
    @book = Book.new
  end

  def index
    @books = Book.order(title: :asc)
  end

  def create
    # render json: params
    @book = Book.new(book_params)
    begin
      @book.save
      redirect_to @book
    rescue StandardError
      flash.now[:errors] = @book.errors.messages.values.flatten
      render 'new'
    end
  end

  def update
    # render json: book_params
    @book.update(book_params)
    redirect_to @book
  end

  def edit; end

  def destroy
    @book.destroy
    redirect_to books_path
  end

  def show; end

  private

  def book_params
    params.require(:book).permit(:title, :publisher, :date_published, :cover, :author_id, genre_ids: [])
  end

  def set_book
    @book = Book.find(params[:id])
  end

  def set_authors_and_genres
    @authors = Author.order(:last_name)
    @genres = Genre.order(:name)
  end

  def check_authorization
    authorize Book
  end
end
