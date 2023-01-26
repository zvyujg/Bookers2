class BooksController < ApplicationController
  
  before_action :correct_user,only:[:edit,:update]
  
  def create 
   @book =Book.new(book_params)
   @book.user_id =currect_user.id
   
    if@book.save
   flash[:notice] = "You have update user successfully."
   redirect_to book_path(@book.id)
    else
    @books =Book.all
    @user=current_user
    render :index
    end
  end
  
  def new
    @book = Book.new
  end

  def index
    @books =Book.all
    @book = Book.new
    @user=current_user
  end

  def show
    @book =Book.find(params[:id])
    @book_new=Book.new
  end

  def edit
    @book =Book.find(params[:id])
  end
  
  
  def update
    @book=Book.find(params[:id])
    if @book.update(book_params)
    flash[:notice] ="You have update user successfull."
    redirect_to book_path(@book)
    else
    render :edit
    end
  end
  
  private
   def book_params
     params.require(:book).permit(:title, :body)
   end
end
