module ApplicationHelper
  # si SimpleCalendar gem est installé, inclure ses helpers
  begin
    include SimpleCalendar::ViewHelpers
  rescue NameError
    # Si le gem n'est pas installé, ignorer sans erreur
    Rails.logger.info "SimpleCalendar::ViewHelpers not available"
  end

  def user_avatar_text
      if user_signed_in?
        current_user.first_name&.first&.upcase || "U"
      else
        "U"
      end
    end

    def user_display_name
      if user_signed_in?
        current_user.first_name || "Utilisateur"
      else
        "Utilisateur"
      end
    end
end
