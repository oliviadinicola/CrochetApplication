class LikesController < ApplicationController

    def new
        @like = Like.new
    end

    def create
      if already_liked?
        flash[:notice] = "You can't like more than once"
      else
        @like = Like.create(like_params)
        @like.user = current_user
        @project = @like.project
        if @like.save
          redirect_to project_path(@project)
        else
          render :new
        end
      end

    end

    def destroy
      @like = Like.where(project_id: params[:id]).find_by(user_id: current_user)
      @project = Project.find(params[:id])
      @like.delete
      redirect_to project_path(@project)
    end

    private
    def like_params
      params.permit(:user_id, :project_id)
    end

    def already_liked?
      Like.exists?(user_id: current_user.id, project_id: params[:project_id] )
    end

end
