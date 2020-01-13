class HomeController < ApplicationController
    def details

    end

    def register
        #not complete
        if params[:username]
            flash[:flashuser] = params[:username]
            redirect_to "/login" 
        end

        
    end
end