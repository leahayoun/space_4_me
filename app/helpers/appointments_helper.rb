# app/helpers/appointments_helper.rb
module AppointmentsHelper
  def appointment_color(appointment)
    # 先获取event_type，处理可能的nil
    event_type = appointment.event_type

    return '#6c757d' if event_type.blank? # 默认灰色

    # 去掉空格，转为小写进行比较
    normalized_type = event_type.strip.downcase

    case normalized_type
    when 'médical', 'medical'
      '#dc3545' # 红色
    when 'social', 'personnel'
      '#28a745' # 绿色
    when 'professionnel', 'travail'
      '#007bff' # 蓝色
    when 'thérapie', 'autre'
      '#6f42c1' # 紫色
    else
      '#6c757d' # 默认灰色
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
