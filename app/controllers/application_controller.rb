class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def after_sign_in_path_for(resource)
    root_path  # O la ruta que desees, como job_applications_path
  end

  allow_browser versions: :modern
end
