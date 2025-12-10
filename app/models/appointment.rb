# app/models/appointment.rb
class Appointment < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :date, presence: true
  # pour le moment un event a pas besoin d'autre validates pour être créer.
end
