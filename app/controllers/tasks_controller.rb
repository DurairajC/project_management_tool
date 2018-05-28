class TasksController < ApplicationController

	def index
	end

	def new
		@task = Task.new
		@developers = User.where("role=?",2)
	end

	def create

		@task = Task.new(task_params)
		@task.assign_attributes({ :status => 1, :project_id => params[:project_id] })
		
		if @task.save
			redirect_to project_path(params[:project_id])
		else
			redirect_to new_task_path
		end

	end
	
	def edit
		@task = Task.find_by_id(params[:id])	
		@project = Project.find_by_id(@task.project_id)
	end
	
	def update
		
		@task = Task.find_by_id(params[:id])
		@task.status = params[:task][:status]
		@task.save
		
		redirect_to projects_path
		
	end

	private
  
	  def task_params
	    params.require(:task).permit(:name, :start_date,:end_date,:assigned_to)
	  end

end
