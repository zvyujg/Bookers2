class BooksController < ApplicationController
  
  
  def create 
   @book =Book.new(book_params)
   @book.user =current_user
    if@book.save
   redirect_to book_path(@book),notice: "You have created book successfully."
    else
    @books =Book.all
    @user= User.find(current_user.id)
    render :index
    end
  end
  
  def new
    @book = Book.new
  end

  def index
    @books =Book.all
    @book = Book.new
    @user= current_user
  end

  def show
    @book =Book.find(params[:id])
    @user = @book.user
    @book_new = Book.new
  end

  def edit
    @book =Book.find(params[:id])
    if @book.user ==current_user
      render "edit"
    else
      redirect_to books_path, notice:"You have updated book successfully."
    end
  end
  
  
  def update
    @book=Book.find(params[:id])
    if @book.update(book_params)
    redirect_to book_path(@book), notice:"You have updated book successfully."
    else
    render :edit
    end
  end
  
  def destroy
    @book=Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end 
    
  private
   def book_params
     params.require(:book).permit(:title, :body)
   end
end
