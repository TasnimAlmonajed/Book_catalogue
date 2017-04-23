class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    @books = Book.all
  end

  def show
  end

  def new
    @book = Book.new
  end

  def edit
  end

  def create
    @book = Book.new(book_params)
    if @book.valid? && !params[:authors].blank?
      if @book.save
        assign_authors_to_book(params[:authors])
        flash[:alert] = 'added new book.'
        redirect_to root_path
      else
        render :new
      end
    else 
      check_authors_existence(params[:authors])
      render :new
    end
  end

  def update
    @book.assign_attributes(book_params)
    if @book.valid?
      if @book.update(book_params)
        assign_authors_to_book(params[:authors])
        flash[:alert] = 'updated the book.'
        redirect_to root_path
      else
        render :edit
      end
    else
      render :edit 
    end
  end

  def destroy
    @book.destroy
    flash[:alert] = 'deleted the book.'
    redirect_to root_path
  end

  private
    def set_book
      @book = Book.find(params[:id])
    end

    def assign_authors_to_book(authors)
      @book.authorbooks.clear
      authors.each do |author|
        @get_author = Author.find(author)
        @book.authorbooks.create(author: @get_author)
      end
    end

    def check_authors_existence(authors_list)
      if authors_list.blank?
        @book.errors.add(:authors, "cannot be null")
      end
    end

    def book_params
      params.require(:book).permit(:title, :isbn, :short_description)
    end
end
