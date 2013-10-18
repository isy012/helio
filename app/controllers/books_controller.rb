class BooksController < ApplicationController

	def create 
		@user = User.find(params[:user_id])
		@book = @user.books.create(params[:book].permit(:title, :description, :pages, :isbn10, :language, :releasedate, :author))
		if @book.save 
		redirect_to user_path(@user.id)
		else 
			render 'new'
		end 
	end 

	def new
		@user = User.find(params[:user_id])
		@book = Book.new
	end

	def destroy
		@user = User.find(params[:user_id])
    	Book.find(params[:id]).destroy
    	flash[:success] = "Book Deleted."
    	redirect_to user_path(@user.id)
  	end

  	def show
  		@user = User.find(params[:user_id])
  		@books = @user.books.find(params[:id])
  	end

  	

end