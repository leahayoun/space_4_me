class Task < ApplicationRecord
  belongs_to :user

  TAGS = ["medical", "administratif", "autres"].freeze

  # validates :title, presence: true
  # validates :tag, inclusion: { in: TAGS }, allow_nil: true

end
