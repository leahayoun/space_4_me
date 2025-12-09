class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :appointments, dependent: :destroy
  has_many :diaries, dependent: :destroy
  has_many :feelings, dependent: :destroy
  has_many :tasks, dependent: :destroy
  has_many :hormonal_treatments, dependent: :destroy
  has_many :operations, dependent: :destroy

end
