# app/helpers/appointments_helper.rb
module AppointmentsHelper
  def appointment_color(appointment)
    # field 'event_type' peut être nil ou une chaîne vide
    event_type = appointment.event_type

    return '#6c757d' if event_type.blank? # default gray color

    # enlever les espaces et mettre en minuscules pour comparaison
    normalized_type = event_type.strip.downcase

    case normalized_type
    when 'médical', 'medical'
      '#dc3545' # red
    when 'social', 'personnel'
      '#28a745' # green
    when 'professionnel', 'travail'
      '#007bff' # blue
    when 'thérapie', 'autre'
      '#6f42c1' # purple
    else
      '#6c757d' # default gray
    end
  end

  def appointment_type_color(event_type)
    return 'secondary' if event_type.blank?

    normalized_type = event_type.strip.downcase

    case normalized_type
    when 'médical', 'medical'
      'danger'
    when 'personnel', 'social'
      'success'
    when 'travail', 'professionnel'
      'primary'
    when 'autre', 'thérapie'
      'warning'
    else
      'secondary'
    end
  end

  def format_appointment_date(date)
    l(date, format: '%A %d %B %Y') if date.present?
  end
end
