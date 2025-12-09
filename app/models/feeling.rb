class Feeling < ApplicationRecord
  belongs_to :user

  has_many :user_moods, dependent: :destroy
  has_many :moods, through: :user_moods

  has_many :user_symptoms, dependent: :destroy
  has_many :symptoms, through: :user_symptoms
end
