require 'spec_helper'

describe "Words" do
  include Warden::Test::Helpers
  Warden.test_mode!
  
  let!(:word) { FactoryGirl.create(:word, word: 'hello_uk', translation: 'hello_ua', user_id: user.id) }
  let(:user) { FactoryGirl.create(:user) }

  before(:each) do
    login_as(user, :scope => :user)
  end
  
  describe 'words listing' do
    it "shows page" do
      visit words_path
      
      expect(page).to have_field('search')
      
      expect(page).to have_link('add_link')
      expect(page).to have_content(user.words.count)
      expect(page).to have_link(word.word)
      expect(page).to have_link(word.translation)
      expect(page).to have_link('delete_link')
    end
  end


  describe 'adding new words' do
    it "adding word", js: true do
      visit words_path
      
      click_link('add_link')
      
      expect(page).to have_field('input_word')
    end
  end

  Warden.test_reset!
end

