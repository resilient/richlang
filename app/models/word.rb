#!/usr/local/bin/ruby
# coding: utf-8

class Word < ActiveRecord::Base
  attr_accessible :example, :progress, :transcription, :translation, :word, :image

  mount_uploader :image, ImageUploader

  belongs_to :user

  validates_presence_of :user_id, presence: true
  validates_presence_of :word, presence: true, message: "Введiть слово"
  validates_presence_of :translation, presence: true, message: "Введiть переклад"

  def self.search(search)
    if search
      where('word LIKE ?', "%#{search}%")
    else
      scoped
    end
  end

end
