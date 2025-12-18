class ApplicationController < ActionController::Base
  before_action :authenticate_user!  # Toutes les pages nécessitent login par défaut
  before_action :configure_permitted_parameters, if: :devise_controller? # Pour ajouter des champs personnalisés à Devise
  before_action :set_locale # Pour le changement de langue FR/EN

  def set_locale
    I18n.locale = cookies[:locale] || I18n.default_locale
  end

  def after_sign_in_path_for(resource)
    if current_user.onboarding
      dashboard_path
    else
      onboarding_path(:step1)
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  protected

  def configure_permitted_parameters
    # Champs supplémentaires pour l'inscription
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :birth_sex, :birth_sex_other, :gender, :gender_other, :date_of_birth])
    # Champs supplémentaires pour la modification du compte
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :birth_sex, :birth_sex_other, :gender, :gender_other, :date_of_birth])
  end
end

  def default_url_options
    {
      host: ENV["DOMAIN"] || "localhost:3000",
      protocol: Rails.env.production? ? "https" : "http"
      }
  end
