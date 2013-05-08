class Word < ActiveRecord::Base
  attr_accessible :example, :progress, :transcription, :translation, :word

  belongs_to :user

  validates :user_id, :word, :translation, presence: true

end
