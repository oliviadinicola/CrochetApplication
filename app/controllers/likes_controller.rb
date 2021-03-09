class LikesController < ApplicationController
    def new
        @like = Like.new
    end

    def create
        @like = Like.create(like_params)
        @like.user = User.last
        @project = @like.project
        if @like.save
          redirect_to project_path(@project)
        else
          render :new
        end

    end

    def delete

    end

    private
    def like_params
      params.permit(:user_id, :project_id)
    end
end
