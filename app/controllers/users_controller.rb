class UsersController < ApplicationController
    def profile
    end
    def user_projects
        @user = User.find(params[:id])
        @projects = @user.projects 
    end

end
