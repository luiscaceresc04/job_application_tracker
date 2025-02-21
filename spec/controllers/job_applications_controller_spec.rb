require 'rails_helper'

RSpec.describe JobApplicationsController, type: :controller do
  let(:user) { create(:user) }
  let(:job_application) { create(:job_application, user: user) }

  before { sign_in user }

  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end
end
