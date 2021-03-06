class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			sign_in user
			redirect_back_or user
			# Sign the user in and redirecto the user's show page.
		else
			# Create an error message and re-render the signin form.
			flash[:notice] = "Invalid email/password combination"
			render 'new'
		end
	end

	def destroy
		sign_out
		redirect_to root_url
	end
end
