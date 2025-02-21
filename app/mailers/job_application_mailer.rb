class JobApplicationMailer < ApplicationMailer
    default from: "luisscaceress4@gmail.com"  # Cambia esto con tu correo

    def interview_scheduled(job_application)
      @job_application = job_application
      @user = job_application.user

      mail(
        to: @user.email,
        subject: "Interview Scheduled for #{@job_application.title}"
      )
    end
end
