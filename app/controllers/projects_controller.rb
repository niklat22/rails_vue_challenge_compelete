class ProjectsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :get_user

  def index
    if params[:sort].present?
      @projects = @user.projects.order(params[:sort])
    else
      @projects = @user.projects.order('created_at DESC')
    end
    render json: {status: 'SUCCESS', data: @projects}, status: :ok
  end

  def new
    @project = Project.new
  end

  def add
  end

  def create
    if @user.blank? || params[:project][:name].blank?
      @valid = "Record are invalidate"
      puts @valid
      render json: {status: 'ERROR', data: @valid}, status: :ok
    else
      @project = Project.new(project_params)
      @project.manager_id = @user.id
      if @project.valid?
        @project.save
        render json: {status: 'SUCCESS', data: @project}, status: :ok
      else
        @valid = "Please set name greter then 1"
        puts @valid
        render json: {status: 'ERROR', data: @valid}, status: :ok
      end
    end
  end

  private
    def project_params
      params.require(:project).permit(:name)
    end

    def get_user
      @user = User.find_by(id: params[:user_id])
      puts "User #{params[:user_id]} not found" if @user.blank?
    end
end
