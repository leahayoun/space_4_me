class Mood < ApplicationRecord

  has_many :user_moods, dependent: :destroy
  has_many :feelings, through: :user_moods

end
