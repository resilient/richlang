require 'spec_helper'

describe User do

  before do
    @user = User.new(name: "Example name", email: "user@example.com", password: "secret2013", password_confirmation: "secret2013", remember_me: true)
  end

  subject { @user }

  it { should respond_to :name }
  it { should respond_to :email }
  it { should respond_to :password }
  it { should respond_to :password_confirmation }
  it { should respond_to :remember_me }
  it { should respond_to(:words) }

  it { should be_valid }


  describe "when name is not present" do
    before { @user.name = " " }
    it { should_not be_valid }
  end

  describe "when email is not present" do
    before { @user.email = " " }
    it { should_not be_valid }
  end

  describe "when password is not present" do
    before { @user.password = @user.password_confirmation = " " }
    it { should_not be_valid }
  end

  describe "when password is too short" do
    before { @user.password = "a" * 7 }
    it { should_not be_valid }
  end

  describe "when password is too long" do
    before { @user.password = "a" * 129 }
    it { should_not be_valid }
  end

  describe "when password doesn't match confirmation" do
    before { @user.password_confirmation = "secret2013zzz" }
    it { should_not be_valid }
  end

end