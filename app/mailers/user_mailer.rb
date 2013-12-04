class UserMailer < ActionMailer::Base
  default :from => "notifications@helio.com"

  def welcome_email(user)
    @user = user
    @url  = 'http://www.helio.com/login'
    mail(:to => @user.email, :subject => "Welcome to Helio")
  end

  def registration_confirmation(user)
  	@user = user 
  	mail(:to => @user.email, :subject =>"Please Confirm Registration")
  end

end