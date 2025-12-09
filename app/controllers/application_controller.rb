class ApplicationController < ActionController::Base
  before_action :authenticate_user!  # Toutes les pages nécessitent login par défaut

  # Pour ajouter des champs personnalisés à Devise
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # Champs supplémentaires pour l'inscription
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    # Champs supplémentaires pour la modification du compte
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end

end
