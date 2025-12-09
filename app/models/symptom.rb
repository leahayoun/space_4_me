class Symptom < ApplicationRecord
  has_many :user_symptoms, dependent: :destroy
  has_many :feelings, through: :user_symptoms

end
