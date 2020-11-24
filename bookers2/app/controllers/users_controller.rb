class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
  	@users = User.all
  	@book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books.page(params[:page]).reverse_order
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render "edit"
    else
      redirect_to books_path
    end
  end

  def update
    @user = User.find(params[:id])
  	@books = @user.books.page(params[:page]).reverse_order
  	if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(current_user.id)
  	else
      render :edit
  	end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image, :title, :body)
  end

end
