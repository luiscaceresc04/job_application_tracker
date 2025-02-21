class JobListingService
    include HTTParty
    base_uri "https://jobicy.com/api/v2/remote-jobs"

    def fetch_jobs
      response = self.class.get("")
      if response.success?
        response.parsed_response["jobs"]
      else
        []
      end
    end
end
