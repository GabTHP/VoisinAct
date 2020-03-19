class ProjectsController < ApplicationController

	def index
	  @projects = Project.all
	end

	def show
	  @projects = Project.find(params[:id])
	end

	def new
	  @project = Project.new
	end

	def create
	  @project = Project.new(project_params)
	  @project.architect = current_user
	  puts project_params
	  if @project.save
	  	redirect_to @project
	  else
	  	render :new
	  end
	end

	private

	def project_params
	  params.require(:project).permit
	end
end 
