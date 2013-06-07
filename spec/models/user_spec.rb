require 'spec_helper'

describe User do

  let(:user) { FactoryGirl.create(:user) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }

  it { should validate_uniqueness_of(:email) }

  it { should validate_confirmation_of(:password) }

  it { should ensure_length_of(:password).is_at_least(8).is_at_most(128) }

  it { should have_many(:words) }

end