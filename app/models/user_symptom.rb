class UserSymptom < ApplicationRecord
  belongs_to :symptom
  belongs_to :feeling
end
