class Symptom < ApplicationRecord

  has_many :user_symptoms, dependent: :destroy

end
