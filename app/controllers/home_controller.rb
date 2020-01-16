class HomeController < ApplicationController

    # Certain pages are visible only to logged-in users:
    before_action :check_if_logged_in, except: [ :index, :login ]
    
    # Lock down admin pages
    # before_action :check_if_admin, only: [ :index ]

    def details

    end

    def index
        if session[:user_id]
            redirect_to "/users/#{session[:user_id]}"
        end
    end

    # def register
    #     # @user = User.new
    #     # @user = User.create user_params #strong params

    #     if @user.persisted?
    #         #account created successfully
    #         session[:user_id] #log in automatically

    #         # redirect to users page

    #     else
    #         # could not register account
    #         # we want to prefill the incomplete form

    #         render.new

    #     end
        
    # end

    # private
    # def user_params
    #     params.require(:user).permit( :username, :fullname, :age, :gender, :country, :state, :city, :password, :confirm_password )
    # end

end