class BooksController < ApplicationController

	def create 
		@user = User.find(params[:user_id])
		@book = @user.books.create(params[:book].permit(:title, :description, :pages, :isbn10, :language, :releasedate))
		if @book.save 
		redirect_to user_path(@user.id)
		else 
			render 'new'
		end 
	end 

	def new
		@user = User.find(params[:user_id])
	end

end