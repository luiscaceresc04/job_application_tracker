require 'net/http'
require 'json'

class JobicyJobsService
  BASE_URL = "https://jobicy.com/api/v2/remote-jobs"

  def self.fetch_jobs
    uri = URI(BASE_URL)
    response = Net::HTTP.get(uri)
    JSON.parse(response)["jobs"] # La API devuelve un hash con una clave "jobs"
  rescue StandardError => e
    Rails.logger.error "Error fetching jobs from Jobicy: #{e.message}"
    []
  end
end
