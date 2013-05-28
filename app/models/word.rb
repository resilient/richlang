class Word < ActiveRecord::Base
  attr_accessible :example, :progress, :transcription, :translation, :word, :image

  mount_uploader :image, ImageUploader

  belongs_to :user

  validates :user_id, presence: true
  validates :word, presence: { message: I18n.t('.enter_word') }
  validates :translation, presence: { message: I18n.t('.enter_translation') }

  def self.search(search)
    if search
      where('word LIKE ?', "%#{search}%")
    else
      scoped
    end
  end

end
