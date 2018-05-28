class ProjectsController < ApplicationController
  def index
  	@all_projects = Project.where("created_by=?",current_user.id)

  	@developers = User.where("role=2")
  	
  	@current_user_projects = current_user.tasks.collect(&:project_id).uniq
  	
  	if @current_user_projects != []
  	  @projects = Project.where(id: @current_user_projects)
  	else
  	  @projects = Project.all
  	end
  	
    @project_size = Project.all

  end

  def new
  	@project = Project.new
  end
  
  def create
  	
  	@project = Project.new(project_params)
  	@project.assign_attributes({ :created_by => 1, :status => params[:project_id] })
  	
    if @project.save
  	  redirect_to projects_path
    else
      render 'new'
    end

  end

  def show
  	@all_tasks = Task.all
  	@project = Project.find(params[:id])
  	@tasks = Task.where("project_id=?",params[:id])
  end

  def update
  end

  private
  
  def project_params
    params.require(:project).permit(:name, :start_date,:end_date)
  end

end
