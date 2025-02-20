class ImportJobicyJobsJob < ApplicationJob
  queue_as :default

  def perform
    jobs = JobicyJobsService.fetch_jobs
    jobs.each do |job|
      JobApplication.find_or_create_by!(
        title: job["title"],
        company_name: job["company"],
        status: "pending",
        applied_on: Date.today
      )
    end
  rescue StandardError => e
    Rails.logger.error "Error importing jobs from Jobicy: #{e.message}"
  end
end
