class UsersController < ApplicationController

  # Certain pages are only visible to logged in users
  before_action :check_if_logged_in, except: [ :new, :create ]

  before_action :check_if_admin, only: [ :index ]

  def new

    if session[:user_id]
      redirect_to "/users/#{session[:user_id]}"
    end

    @user = User.new
  end

  def create

    @user = User.create user_params
    
    if @user.persisted?
      # account created succesfully
      session[:user_id] = @user.id # log them in automatically!
      redirect_to user_path(@user.id)
    else
      # there was an error, show the prefilled signup form again
      render :new
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(session['user_id'])
    if Score.exists?(user_id: @user.id)
      @score = Score.find(@user.id)
      @personality = @score.personality
      if @personality == ""
        @personality = "Not Completed"
      end
      @match =  Match.find_by(personality: @personality)
    else
      @personality = "Not Completed"
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit( :username, :fullname, :age, :gender, :country, :state, :city, :password, :confirm_password )
  end
end
