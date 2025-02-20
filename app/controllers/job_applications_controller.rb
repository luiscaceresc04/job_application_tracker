class JobApplicationsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  before_action :set_job_application, only: [:show, :edit, :update, :destroy]

  def index
    if JobApplication.count == 0
      JobicyJobImporter.import
    end
    @job_applications = JobApplication.all
    @external_jobs = fetch_external_jobs
  end

  def show
  end

  def new
    @job_application = current_user.job_applications.new
  end

  def create
    @job_application = current_user.job_applications.new(job_application_params)
    if @job_application.save
      redirect_to @job_application, notice: 'Job application was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @job_application.update(job_application_params)
      if @job_application.interview_scheduled?
      end
      redirect_to root_path, notice: "Job application updated successfully."
     else
      flash.now[:alert] = "There was an error updating the job application."
      render :edit
    end
  end
  

  def destroy
    @job_application.destroy
    redirect_to job_applications_path, notice: "Job application deleted successfully."
  end

  private

  def set_job_application
    @job_application = JobApplication.find(params[:id])
  end

  def job_application_params
    params.require(:job_application).permit(:title, :company_name, :applied_on, :status)
  end

  def fetch_external_jobs
    response = Faraday.get("https://jobicy.com/api/v2/remote-jobs")
    JSON.parse(response.body)["jobs"] if response.status == 200
  end

  def import_jobicy_jobs
    ImportJobicyJobsJob.perform_later
    redirect_to job_applications_path, notice: "Importación en proceso..."
  end
end
