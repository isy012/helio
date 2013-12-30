class UserMailer < ActionMailer::Base
  default :from => "notifications@helio.com"

  def welcome_email(user)
    @user = user
    @url  = 'http://www.helio.com/login'
    mail( :to => @user.email, 
          :subject => "Welcome to Helio")
  end

  def profile_updated_email(user)
    @user = user
    @url  = 'http://www.helio.com/'
    mail( :to => @user.email, 
          :subject => "Your Profile Has Been Updated") do |format| 
            format.html 
            format.text
  end
end

  def user_signedup_email(user)
    @user = user
    @url  = 'http://www.helio.com/'
    mail(:to => "isabelle.y.park@gmail.com", :subject =>"User Registration Alert")
  end

  def registration_confirmation(user)
  	@user = user 
  	mail(:to => @user.email, :subject =>"Please Confirm Registration")
  end

end