class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
    @likes = Like.where(project_id: params[:id]) 
    @like = Like.new
    @comments = Comment.where(project_id: params[:id])
    @comment = Comment.new
  end

  def new
    @project = Project.new
  end

  
  def create
    @project = Project.new(project_params)
    @project.user = User.first #needs to be fixed later 

    if @project.save
      redirect_to @project
    else
      render :new
    end
  end
  
  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    @project.update(project_params)

    redirect_to @project
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    redirect_to @project
  end

  def home
  end

  def profile
  end

  def myprojects
  end
  


  private
    def project_params
      params.require(:project).permit(:name, :instructions, :hook_size, :yarn_size, :difficulty, :photo)
    end
end
