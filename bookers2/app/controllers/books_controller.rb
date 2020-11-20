class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @books = Book.all
  	@book = Book.new(book_params)
  	@book.user_id = current_user.id
  	if @book.save
  	   flash[:notice] = "You have creatad book successfully."
  	   redirect_to book_path(@book.id)
  	else
  	   render :index
  	end
  end

  def index
    @books = Book.all
  end

  def show
  end

  def edit
  end

  def destroy
  end

  def update
  end

  private

  def book_params
  	params.require(:book).permit(:title, :body)
  end

end
