# encoding: utf-8

require 'spec_helper'

describe Word do

  it { should belong_to(:user) }

  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:word).with_message(I18n.t('.enter_word')) }
  it { should validate_presence_of(:translation).with_message(I18n.t('.enter_translation')) }


  describe '#search' do
    it "returns matched results of search" do
      hello = FactoryGirl.create(:word, word: 'hello_uk', translation: 'hello_ua')
      hi = FactoryGirl.create(:word, word: 'hi_uk', translation: 'hi_ua')
      hey = FactoryGirl.create(:word, word: 'hey_uk', translation: 'hey_ua')

      expect(Word.search("he")).to eq [hello, hey]
    end
  end

end