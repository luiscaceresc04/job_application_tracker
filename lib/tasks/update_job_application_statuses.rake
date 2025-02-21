namespace :job_applications do
    desc "Update job application statuses to use integers"
    task update_statuses: :environment do
      JobApplication.where(status: "Pending").update_all(status: 0)
      JobApplication.where(status: "Interview Scheduled").update_all(status: 1)
      JobApplication.where(status: "Rejected").update_all(status: 2)
      puts "Job application statuses updated successfully!"
    end
  end
