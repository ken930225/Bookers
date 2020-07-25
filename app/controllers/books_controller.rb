class BooksController < ApplicationController
  before_action :authenticate_user!
  def index
  	@books = Book.all
    @book = Book.new
    @user = current_user
    @favorite = Favorite.new
  end

  def show
  	@book = Book.find(params[:id])
    @newbook = Book.new
    @user = User.find(@book.user.id)
    @comments = @book.comments
    @comment = Comment.new
  end

  def new
  	@book = Book.new
  end

  def create
      @book = Book.new(book_params)
      @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have creatad book successfully."
      redirect_to book_path(@book)
    else
      @books = Book.all
      @user = current_user
      render "index"
    end
  end

  def edit
  	 @book = Book.find(params[:id])
     @newbook = Book.new
     @user = User.find(@book.user_id)
    if @book.user == current_user
      render "edit"
    else
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book)
    else
      @books = Book.all
      flash[:notice] = "error."
      render action: :edit
    end
  end

  def destroy
  	@book = Book.find(params[:id])
  	@book.destroy
  	redirect_to books_path
  end

  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end
end
