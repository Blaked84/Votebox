class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy, :vote, :membership]

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
    #authorize! :show, @projects
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    authorize! :show, @project
  end

  # GET /projects/new
  def new
    @project = Project.new
    authorize! :create, @project
  end

  # GET /projects/1/edit
  def edit
    authorize! :edit, @project
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)
    authorize! :create, @project

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    authorize! :edit, @project
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    authorize! :delete, @project
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def vote
    authorize! :vote, @project
    case params[:direction]
      when 'up'
        current_user.voted_for?(@project) ?
            current_user.unvote_for(@project) :
            current_user.vote(@project, { :exclusive => true, :direction => :up })
      when 'down'
        current_user.voted_against?(@project) ?
            current_user.unvote_for(@project) :
            current_user.vote(@project, { :exclusive => true, :direction => :down })
      else
        current_user.unvote_for(@project)
    end
    redirect_to request.referrer
  end

  def membership
    authorize! :join, @project
    case params[:membership_action]
      when 'join'
        current_user.projects << @project
      else
        current_user.projects.delete(@project)
    end
    redirect_to request.referrer
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = params[:id].present? ?
          Project.find(params[:id]) :
          Project.find(params[:project_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      list_allowed_param = [:name, :description, :category_id]
      list_allowed_param << :user_id if can? :manage, Project
      params.require(:project).permit(list_allowed_param)
    end
end
