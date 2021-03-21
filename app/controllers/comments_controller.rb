class CommentsController < ApplicationController
    def new
        @comment = Comment.new
    end

    def create 
        @comment = Comment.create(comment_params)  
        @comment.project = Project.find(params[:project_id])
        @comment.user = current_user

        if @comment.save
            redirect_to project_path(@comment.project.id)
        else
            render :new
        end

    end

    def delete
        @comment = @project.comments.find(params[:id])
        @comment.destroy
    end

    private
    def comment_params
        params.require(:comment).permit(:comment_content, :user_id, :project_id)
    end
end
