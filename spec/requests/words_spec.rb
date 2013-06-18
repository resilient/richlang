require 'spec_helper'

describe "Words" do
  include Warden::Test::Helpers
  Warden.test_mode!

  user = FactoryGirl.create(:user)
  word = FactoryGirl.create(:word, user: user, word: 'hello_uk', translation: 'hello_ua')

  before(:each) do
    login_as(user, :scope => :user)
    visit words_path
  end

  it "list page" do
    expect(page).to have_field('search')

    expect(page).to have_link('add_link')
    expect(page).to have_content(user.words.count)
    expect(page).to have_link(word.word)
    expect(page).to have_link(word.translation)
    expect(page).to have_link('delete_link')
  end

  it "adding word", :js => true do
    click_link('add_link')
    #print page.html
    #expect(page).to have_сss('#input_word')
    expect(page).to have_field('input_word')
  end

  Warden.test_reset!
end

