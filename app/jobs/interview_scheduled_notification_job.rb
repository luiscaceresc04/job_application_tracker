class InterviewScheduledNotificationJob < ApplicationJob
  queue_as :default

  def perform(job_application_id)
    job_application = JobApplication.find(job_application_id)
    UserMailer.with(job_application: job_application).interview_scheduled.deliver_later
  end
end
