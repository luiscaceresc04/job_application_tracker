class JobicyJobImporter
    def self.import
      response = Faraday.get("https://jobicy.com/api/v2/remote-jobs") # La URL de la API
      jobs = JSON.parse(response.body)["jobs"]

      jobs.each do |job|
        JobApplication.create!(
          title: job["title"],
          company_name: job["company"],
          applied_on: Time.zone.now, # O cualquier fecha que corresponda
          status: "pending", # O el estado que prefieras
          user: User.first # Asegúrate de que el trabajo esté asociado a un usuario (puedes cambiarlo según sea necesario)
        )
      end
    end
end
