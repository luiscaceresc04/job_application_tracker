FactoryBot.define do
    factory :job_application do
      title { "Software Engineer" }
      company_name { "TechCorp" }
      applied_on { Date.today }
      status { "applied" }
      association :user
    end
  end
