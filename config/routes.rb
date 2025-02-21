require "sidekiq/web"

Rails.application.routes.draw do
  root "job_applications#index"

  devise_for :users

  resources :job_applications do
    member do
      patch :schedule_interview
    end
  end

  get "/job_listings", to: "job_listings#index", as: :job_listings

  mount Sidekiq::Web => "/sidekiq"

  post "import_jobicy_jobs", to: "job_applications#import_jobicy_jobs"
end
