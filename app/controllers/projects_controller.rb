class ProjectsController < ApplicationController
  def index 
    if params[:search]
      @projects = Project.search(params[:search])
      @projects = @projects.filter_by_difficulty(params[:difficulty]) if params[:difficulty].present?
      @projects = @projects.filter_by_yarn_size(params[:yarn_size]) if params[:yarn_size].present?
      @projects = @projects.filter_by_hook_size(params[:hook_size]) if params[:hook_size].present?  
    else
      @projects = Project.where(nil)
      @projects = @projects.filter_by_difficulty(params[:difficulty]) if params[:difficulty].present?
      @projects = @projects.filter_by_yarn_size(params[:yarn_size]) if params[:yarn_size].present?
      @projects = @projects.filter_by_hook_size(params[:hook_size]) if params[:hook_size].present?  
    end
   
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

    redirect_to myprojects_path
  end

  def home
  end

  def profile
  end

  def myprojects
  end
  


  private
    def project_params
      params.require(:project).permit(:name, :instructions, :hook_size, :yarn_size, :difficulty, :photo, :search)
    end

    def filtering_params
      params.permit(:difficulty, :hook_size, :yarn_size);
    end
end
