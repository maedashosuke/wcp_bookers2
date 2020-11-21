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
  	   redirect_to books_path(@book.id)
  	else
  	   render :new
  	end
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  	@book_new = Book.new
  	@user = current_user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
  	@book.destroy
  	redirect_to books_path
  end

  def update
  end

  private

  def book_params
  	params.require(:book).permit(:title, :body)
  end

end
