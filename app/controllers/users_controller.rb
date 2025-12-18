# app/controllers/users_controller.rb
class UsersController < ApplicationController
  before_action :authenticate_user!

  def profile
    @user = current_user
  end

  def settings
    @user = current_user
  end

  # Change language (FR/EN)
  def update_locale
    locale = params[:locale]
    if %w[fr en].include?(locale)
      cookies[:locale] = { value: locale, expires: 1.year.from_now }
      I18n.locale = locale
    end
    redirect_back fallback_location: settings_path, notice: t('settings.language_updated')
  end

  # Export user data as JSON (journal, tasks, appointments)
  def export_data
    @user = current_user
    data = {
      export_date: Date.today,
      journal: @user.diaries.order(created_at: :desc).map do |d|
        {
          title: d.title,
          content: d.content.to_plain_text,
          created_at: d.created_at.strftime("%d/%m/%Y %H:%M")
        }
      end,
      tasks: @user.tasks.order(created_at: :desc).map do |t|
        {
          title: t.title,
          description: t.description,
          category: t.tag,
          done: t.done,
          created_at: t.created_at.strftime("%d/%m/%Y")
        }
      end,
      appointments: @user.appointments.order(date: :desc).map do |a|
        {
          title: a.title,
          date: a.date&.strftime("%d/%m/%Y"),
          time: a.start_time&.strftime("%H:%M"),
          type: a.event_type,
          address: a.address,
          notes: a.content
        }
      end
    }

    send_data JSON.pretty_generate(data),
              filename: "space4me_export_#{Date.today}.json",
              type: 'application/json'
  end
end
