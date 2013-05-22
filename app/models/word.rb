#!/usr/local/bin/ruby
# coding: utf-8

class Word < ActiveRecord::Base
  attr_accessible :example, :progress, :transcription, :translation, :word, :image

  mount_uploader :image, ImageUploader

  belongs_to :user

  validates :user_id, presence: true
  validates :word, presence: { message: "Введiть слово" }
  validates :translation, presence: { message: "Введiть переклад" }

  def self.search(search)
    if search
      where('word LIKE ?', "%#{search}%")
    else
      scoped
    end
  end

end
