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
      'danger'    # 对应红色
    when 'social'
      'success'   # 对应绿色
    when 'professionnel'
      'primary'   # 对应蓝色
    when 'thérapie'
      'warning'   # 对应黄色（或用 'info' 对应青色）
    else
      'secondary' # 对应灰色
    end
  end

  def format_appointment_date(date)
    l(date, format: '%A %d %B %Y') if date.present?
  end

end
