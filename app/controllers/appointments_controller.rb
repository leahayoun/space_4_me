class AppointmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  # 1-home
  def index
    # @appointments = Appointment.where(user: current_user)
    # Récupérer les rendez-vous de l'utilisateur
    @appointments = current_user.appointments.order(date: :asc)

    # Déterminer le type de vue (mois ou semaine)
    @view_type = params[:view] || 'month'

    # Déterminer la date actuelle
    if params[:date]
      @current_date = Date.parse(params[:date])
    else
      @current_date = Date.today
    end
  end

  # 2-show action
  def show
    @appointment = Appointment.find(params[:id])
  end

  # 3-new needs a form
  def new
    @appointment = Appointment.new
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
    redirect_to appointments_path
  end



  private

  # 8- Strong params

  def appointment_params
    params.require(:appointment).permit(:title, :content, :date, :event_type)
  end

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end
end
