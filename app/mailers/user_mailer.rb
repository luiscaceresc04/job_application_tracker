class UserMailer < ApplicationMailer
    default from: 'notifications@jobapplicationtracker.com'
  
    def interview_scheduled(job_application)
      @job_application = params[:job_application]
      mail(to: @job_application.user.email, subject: 'Interview Scheduled')
    end
  end