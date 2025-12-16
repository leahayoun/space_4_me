module ApplicationHelper
  # si SimpleCalendar gem est installé, inclure ses helpers
  begin
    include SimpleCalendar::ViewHelpers
  rescue NameError
    # Si le gem n'est pas installé, ignorer sans erreur
    Rails.logger.info "SimpleCalendar::ViewHelpers not available"
  end
end
