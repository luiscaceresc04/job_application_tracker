class JobApplication < ApplicationRecord
  belongs_to :user

  enum :status, { pending: 0, interview_scheduled: 1, rejected: 2 }

  validates :title, :company_name, :applied_on, presence: true

  after_update :send_interview_scheduled_notification, if: :interview_scheduled_status?
  
  private

  def send_interview_scheduled_notification
    InterviewScheduledNotificationJob.perform_later(self.id)
  end
end
