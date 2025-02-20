class JobListingsController < ApplicationController
    def index
      @job_listings = JobListingService.new.fetch_jobs
    end
  end