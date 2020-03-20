class ProjectsController < ApplicationController
	before_action :authenticate_user!, except: [:index]

	def index
	  @projects = Project.all
	end

	def show
	  @project = Project.find(params[:id])
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
	  params.require(:project).permit(:title, :description, :city, :number_of_participants, :amount_needed)
	end
end 
