# encoding: utf-8

require 'spec_helper'

describe "Words" do
  include Warden::Test::Helpers
  Warden.test_mode!

  user = FactoryGirl.create(:user)
  word = FactoryGirl.create(:word, user: user, word: 'hello_uk', translation: 'hello_ua')

  it "list page" do
    login_as(user, :scope => :user)

    visit words_path

    page.should have_field('search')
    page.should have_link('add_link')
    page.should have_content(user.words.count)
    page.should have_link(word.word)
    page.should have_link(word.translation)
    page.should have_link('delete_link')
  end

  Warden.test_reset!
end

