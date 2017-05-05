require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  before :each do
    @project=FactoryGirl.create(:project)
  end

  describe "user logged in" do
    login_user

    it "should have a current_user" do
      expect(subject.current_user).to_not eq(nil)
    end

    it "should get index" do
      get 'index'
      response.should be_success
    end

    it "should get show/:id" do
      get :show, id: @project.id
      response.should be_success
    end

    it "should get update/:id for his projects" do
      project=FactoryGirl.create(:project, user_id: subject.current_user.id, name: "test")
      patch :update, id: project.id, project: {name: "test_mod"}
      expect(response).to redirect_to(project)
      new_project = Project.find(project.id)
      expect(new_project.name).to eq("test_mod")
    end

    it "shouldn't get update/:id for other's projects" do
      get :update, id: @project.id
      response.should be_forbidden
    end

    it "shouldn't get destroy/:id for projects" do
      get :destroy, id: @project.id
      response.should be_forbidden
    end

    it "should get vote/:id for projects" do
      post :vote, project_id: @project.id,  format: :json
      response.status.should eq(201)
      # response.should be_success
    end

    it "should get membership/:id for projects" do
      post :membership, project_id: @project.id,  format: :json
      response.status.should eq(201)
      # response.should be_success
    end
  end

  describe "user not logged in" do

    it "shouldn't have a current_user" do
      expect(subject.current_user).to eq(nil)
    end

    it "should get index" do
      get 'index'
      response.should be_success
    end

    it "shouldn't get show/:id" do
      get :show, id: @project.id, format: :json
      response.should be_forbidden
    end

    it "shouldn't get update/:id for projects" do
      get :update, id: @project.id, format: :json
      response.should be_forbidden
    end

    it "shouldn't get destroy/:id for projects" do
      get :destroy, id: @project.id, format: :json
      response.should be_forbidden
    end

    it "shouldn't get vote/:id for projects" do
      post :vote, project_id: @project.id
      is_expected.to redirect_to new_user_session_path
    end

    it "shouldn't get membership/:id for projects" do
      post :membership, project_id: @project.id
      is_expected.to redirect_to new_user_session_path
    end
  end

end
