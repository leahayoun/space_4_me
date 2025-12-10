class Diary < ApplicationRecord
  belongs_to :user

  has_rich_text :content # pas de colonne content dans table diaries, mais c'est normal

  has_many_attached :documents

end
