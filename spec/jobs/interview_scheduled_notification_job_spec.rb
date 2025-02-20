require 'rails_helper'

RSpec.describe InterviewScheduledNotificationJob, type: :job do
  include ActiveJob::TestHelper

  it "sends an email when job application status is updated to interview_scheduled" do
    job_application = create(:job_application, status: "interview_scheduled")
    expect {
      InterviewScheduledNotificationJob.perform_later(job_application.id)
    }.to have_enqueued_job
  end
end
