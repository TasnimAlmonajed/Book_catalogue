class AuthorsController < ApplicationController
  before_action :set_author, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @authors = Author.all
  end

  def show
  end

  def new
    @author = Author.new
  end

  def edit
  end

  def create
    @author = Author.new(author_params)
    if @author.valid?
      if @author.save
        flash[:alert] = 'added new author.'
        redirect_to authors_path
      end
    else 
      render :new
    end
  end

  def update
    @author.assign_attributes(author_params)
    if @author.valid?
      if @author.update(author_params)
        flash[:alert] = 'edited the author.'
        redirect_to authors_path
      end
    else
      render :edit 
    end
  end

  def destroy
    @author.destroy
    flash[:alert] = 'removed the author.'
    redirect_to authors_path
  end

  private
    def set_author
      @author = Author.find(params[:id])
    end

    def author_params
      params.require(:author).permit(:name)
    end
end
