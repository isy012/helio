require 'rubygems'
require 'httparty'
require 'json'
require 'open-uri'


class UsersController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy
  include HTTParty


  def index
    @users = User.all
  end

  def new
  	@user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      UserMailer.welcome_email(@user).deliver
      sign_in @user
      flash[:success] = "Welcome to Helio!"
      redirect_to @user
    else
      render 'new'
    end
  end 

  def show
  	@user = User.find(params[:id])
    @books = @user.books.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update 
    @user = User.find(params[:id])
    
    if @user.update_attributes(user_params)
      flash[:success] = "Profile Updated"
      redirect_to user_path(@user.id)
    else
      render 'edit'
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to root_url
  end

  def metadata
      require 'net/http'
      require 'uri'
      response = Net::HTTP.get(URI.parse('http://www.google.com'))
      http = Net::HTTP.new(uri.host, uri.port)
      @response = http.request(request)
  end

private

    def user_params
      params.require(:user).permit(:name, :email, :password, :bio,
                                   :password_confirmation)
    end


   #Before filters

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Oops. Please sign in."
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

end
