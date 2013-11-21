require 'spec_helper'

describe User do
  before { @user = User.new(name: 'liugang',
                            emall: '501225658@qq.com',
                            password: "foobar",
                            password_confirmation: "foobar") }

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:emall) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:authenticate) }
  it { should be_valid }

  describe "when name is blank" do
    before { @user.name = '' }
    it { should_not be_valid }
  end

  describe "when emall is blank" do
    before { @user.emall = '' }
    it { should_not be_valid }
  end

  describe "when name is to long" do
    before { @user.name = 'a'*51 }
    it { should_not be_valid }
  end

  describe "emall format is valid" do
    before { @user.emall = 'liugang@networking' }
    it { should_not be_valid }
  end

  describe "user emall should uniq" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.emall = @user.emall.upcase
      user_with_same_email.save
    end

    it { should_not be_valid }
  end

  describe "when password is not present" do
    before do
      @user = User.new(name: "Example User", emall: "user@example.com",
                       password: " ", password_confirmation: " ")
    end
    it { should_not be_valid }
  end

  describe "when password doesn't match confirmation" do
    before { @user.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end

  describe "with a password that's too short" do
    before { @user.password = @user.password_confirmation = "a" * 5 }
    it { should be_invalid }
  end

  describe "return value of authenticate method" do
    before { @user.save }
    let(:found_user) { User.find_by(emall: @user.emall) }

    describe "with valid password" do
      it { should eq found_user.authenticate(@user.password) }
    end

    describe "with invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }

      it { should_not eq user_for_invalid_password }
      specify { expect(user_for_invalid_password).to be_false }
    end
  end
end