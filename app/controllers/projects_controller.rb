class ProjectsController < ApplicationController

  before_filter :authenticate_user!

  def index
    @projects = current_user.projects.all
  end

  def new
    @project = current_user.projects.build
  end

  def create
    @project = current_user.projects.build(params[:project])
    if @project.save
      redirect_to project_url(@project), notice: "Successfully created a Project"
    else
      render :new
    end
  end

  def edit
    @project = current_user.projects.find(params[:id])
  end

  def update
    @project = current_user.projects.find(params[:id])

    if @project.update_attributes(params[:project])
      redirect_to project_url(@project), notice: "Successfully created a Project"
    else
      render :edit
    end
  end

  def show
    @project = current_user.projects.find(params[:id])
  end

  def destroy
    @project = current_user.projects.find(params[:id])
    @project.destroy

    if @project.destroyed?
      redirect_to projects_url, notice: "Project successfully deleted" 
    else
      redirect_to projects_url, error: "Unable to delete a project"
    end
  end

end
