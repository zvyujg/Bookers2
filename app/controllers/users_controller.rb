class UsersController < ApplicationController
  
  def index
    @books =Book.all
    @user = current_user
    @users = User.all
    @book = Book.new
  end

  def show
    @user =User.find(params[:id])
    @books =@user.books
    @book = Book.new
  end

  def edit
    @user =User.find(params[:id])
    if @user == current_user
      render "edit"
    else
      redirect_to user_path(current_user)
    end
  end
  
  def update
    @user=User.find(params[:id])
    @user.id =current_user.id
    if @user.update(user_params)
    redirect_to user_path(@user.id), notice:"You have update user successfully"
    else
    render :edit
    end
  end
  
  private
   def user_params
     params.require(:user).permit(:name, :introduction,:profile_image)
   end
end


