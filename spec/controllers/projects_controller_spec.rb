require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  describe "GET index" do
    it "return value" do
      if params[:sort].present?
        @projects = @user.projects.order(params[:sort])
      else
        @projects = @user.projects.order(:name)
      end
    end
  end

  describe "POST create" do
    it "create record" do
      @user = Project.new(manager_id: params[:user_id], name: params[:name])
      if @user == params[:user_id]
        @user.save
      end
    end
  end
end
