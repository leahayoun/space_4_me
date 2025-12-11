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
end
