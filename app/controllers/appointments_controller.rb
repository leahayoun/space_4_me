class AppointmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  # 1-home
  def dashboard
    # @appointments = Appointment.where(user: current_user)
    # Récupérer les rendez-vous de l'utilisateur
    @appointments = current_user.appointments
                                .where("date >= ?", Date.today)
                                .order(date: :asc)

    # Déterminer le type de vue (mois ou semaine)
    @view_type = params[:view] || 'month'
    # Déterminer la date actuelle
    if params[:date]
      @current_date = Date.parse(params[:date])
    else
      @current_date = Date.today
    end

  end

  # 1.bis  index
  def index
    @appointments = current_user.appointments.order(date: :asc)
  end

  def index
    # 1. obtenir le filtre depuis les paramètres (par défaut 'upcoming')
    @filter = params[:filter] || 'upcoming'

    # 2. avec le filtre, récupérer les rendez-vous appropriés
    @appointments = current_user.appointments.order(date: :asc)

    case @filter
    when 'past'
      @appointments = @appointments.where("date < ?", Date.today)
    when 'all'
    else # 'upcoming'
      @appointments = @appointments.where("date >= ?", Date.today)
    end
  end

  # 2-show action
  def show
    @appointment = Appointment.find(params[:id])
    if @appointment.user != current_user
    redirect_to appointments_path, alert: "You are not authorized to view this appointment."
    end
  end

  # Nouvelle méthode pour afficher les détails d'une journée
 def day_details
  # Gérer la date avec résilience
  if params[:date].present?
    begin
      @date = Date.parse(params[:date])
    rescue ArgumentError
      @date = Date.today
      flash[:alert] = "Date invalide. Affichage d'aujourd'hui."
    end
  else
    @date = Date.today
  end

  # Récupérer les rendez-vous de la journée
  @appointments = current_user.appointments
                              .where(date: @date)
                              .order(:start_time)

  # Récupérer le feeling du jour s'il existe
  @feeling = current_user.feelings
                         .where("DATE(created_at) = ?", @date)
                         .first

  # Ne pas utiliser request.xhr? pour l'instant
  # On va toujours rendre la page complète
end

  # 3-new needs a form
  def new
    @appointment = Appointment.new

    if params[:date].present?
      begin
        @appointment.date = Date.parse(params[:date])
      rescue ArgumentError
        @appointment.date = Date.today
      end
    else
      @appointment.date = Date.today
    end
  end

  # 4-create pas de view
  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.user = current_user
    if @appointment.save
      redirect_to root_path, notice: 'Event Created!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # 5 et 6- edit + update

  def edit
    @appointment = Appointment.find(params[:id])
  end

  def update
    @appointment = Appointment.find(params[:id])
    if @appointment.update(appointment_params)
      redirect_to appointment_path(@appointment)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # 7-Delete

  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    redirect_to appointments_path, notice: 'Appointment deleted successfully.'
  end



  private

  # 8- Strong params

  def appointment_params
    params.require(:appointment).permit(:title, :content, :date,
                                        :event_type, :address, :start_time)
  end

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end
end
