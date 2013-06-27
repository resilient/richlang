require 'spec_helper'

describe "Words" do
  include Warden::Test::Helpers
  Warden.test_mode!
  
  let!(:word) { FactoryGirl.create(:word, word: 'hello_uk', translation: 'hello_ua', user_id: user.id) }
  let(:user) { FactoryGirl.create(:user) }

  before(:each) do
    login_as(user, :scope => :user)
    visit words_path
  end
  
  describe 'words listing' do
    it "shows page" do
      expect(page).to have_field('search')

      expect(page).to have_link('add_link')
      expect(page).to have_content(user.words.count)

      expect(page).to have_link(word.word)
      expect(page).to have_link(word.translation)
      expect(page).to have_link('delete_link')
    end
  end

  describe 'show word' do
    it "word" do
      click_link(word.word)

      expect(page).to have_content(word.word)
      expect(page).to have_content(word.translation)

      expect(page).to have_link('back_button')
    end
  end

  describe 'adding new words' do
    it "adding word", js: true do
      click_link('add_link')

      within('.new_word') do
        fill_in 'input_word', :with => 'boy_uk'
        fill_in 'word_translation', :with => 'boy_ua'

        click_button 'save_form_btn'
      end

      expect(page).to have_link('boy_uk')
      expect(page).to have_link('boy_ua')
    end
  end

  describe 'delete word' do
    it "deleting word", js: true do
      click_link('delete_link')

      expect(page).not_to have_link(word.word)
      expect(page).not_to have_link(word.translation)
    end
  end

  describe 'search results' do
    it "result", js: true do
      within('#words_search') do
        fill_in 'search', :with => 'h'
      end

      expect(page).to have_link('hello_uk')
      expect(page).to have_link('hello_ua')
    end

    it "no result", js: true do
      within('#words_search') do
        fill_in 'search', :with => 'ha'
      end

      expect(page).to have_css('.not_found')
    end
  end

  Warden.test_reset!
end

