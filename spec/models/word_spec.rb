# encoding: utf-8

require 'spec_helper'

describe Word do

  let(:user) { FactoryGirl.create(:user) }

  before do
    @word = user.words.build(word: 'dog', translation: 'собака')
  end

  subject { @word }

  it { should respond_to :word }
  it { should respond_to :user_id }
  it { should respond_to :example }
  it { should respond_to :progress }
  it { should respond_to :transcription }
  it { should respond_to :image }
  it { should respond_to(:user) }
  its(:user) { should == user }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @word.user_id = nil }
    it { should_not be_valid }
  end

  describe "when blank word" do
    before { @word.word = " " }
    it { should_not be_valid }
  end

  describe "when blank translation" do
    before { @word.translation = " " }
    it { should_not be_valid }
  end

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Word.new(user_id: user.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end

end