# encoding: utf-8

require 'spec_helper'

describe Word do

  let(:word) { FactoryGirl.create(:word) }

  it { should belong_to(:user) }

  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:word).with_message(I18n.t('.enter_word')) }
  it { should validate_presence_of(:translation).with_message(I18n.t('.enter_translation')) }

end