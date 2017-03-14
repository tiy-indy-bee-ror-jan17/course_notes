class UserMailer < ApplicationMailer

  def signup(user)
    @user = user
    mail(to: 'chris@chrisvannoy.com', subject: "Welcome to Chirpy!")
  end

end
