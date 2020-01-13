class HomeController < ApplicationController
    def details

    end

    def register

        hold = false

        #not complete
        if !params[:username]
            flash[:user_error] = "Please enter a username"
        end

        if !params[:fullname]
            flash[:name_error] = "Full name cannot be blank"   
        end

        if !params[:country]
            flash[:country_error] = "Country cannot be blank"   
        end

        if !params[:state]
            flash[:state_error] = "State name cannot be blank"   
        end

        if !params[:city]
            flash[:city_error] = "City cannot be blank"   
        end

        if !params[:password]
            flash[:password_error] = "Password cannot be blank."   
        end

        if !params[:confirm_password]
            flash[:confirm_password_error] = "Please confirm your password."   
        end


        # redirect_to "/login"

        
    end
end