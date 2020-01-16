class SessionController < ApplicationController
  def new
    if session[:user_id]
      redirect_to "/users/#{session[:user_id]}"
    end
  end

  def create
    # see if email address exists
    user = User.find_by username: params[:username]

    #did we find a user? is the password correct?
    if user.present? && user.authenticate(params[:password])
      # successful login

      # Generate Session Key
      session[:user_id] = user.id

      # redirect to user page
      redirect_to  user_path(user.id) #go to users page
    else
      # failed login (wrong credentials)

      flash[:error] = 'Invalid email or password'

      redirect_to login_path # show the form again
    end
  end

  def destroy
    session[:user_id] = nil # log out user
    redirect_to login_path
  end
end
