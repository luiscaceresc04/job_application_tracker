require 'rails_helper'

RSpec.describe JobApplicationsController, type: :controller do
  let(:user) { create(:user) }
  let(:job_application) { create(:job_application, user: user) }

  before do
    sign_in user
  end

  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end

    it "assigns the correct job applications to @job_applications" do
      get :index
      expect(assigns(:job_applications)).to eq([ job_application ])
    end
  end
end
