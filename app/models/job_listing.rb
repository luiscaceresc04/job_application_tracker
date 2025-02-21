class JobListing < ApplicationRecord
    validates :title, :company_name, :url, presence: true
end
