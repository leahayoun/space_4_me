# app/helpers/appointments_helper.rb

module AppointmentsHelper
  # Couleur selon le type de rendez-vous
  def appointment_color(appointment)
    case appointment.event_type&.downcase
    when 'médical'
      '#dc3545' # Rouge
    when 'social'
      '#28a745' # Vert
    when 'professionnel'
      '#007bff' # Bleu
    when 'thérapie'
      '#6f42c1' # Violet
    else
      '#6c757d' # Gris
    end
  end

  #  pour bootstrap
  def appointment_type_color(event_type)
    case event_type&.downcase
    when 'médical'
      'danger'    # rouge
    when 'social'
      'success'   # vert
    when 'professionnel'
      'primary'   # blue
    when 'thérapie'
      'warning'   # jaune
    else
      'secondary' # gris
    end
  end

  def format_appointment_date(date)
    l(date, format: '%A %d %B %Y') if date.present?
  end

end
