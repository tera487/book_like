require "rails_helper"

RSpec.describe "User" do
  before do
    @user = build(:user)
  end

  describe "登録" do
    it "すべての値が正しく入力されていれば登録できる" do
      expect(@user).to be_valid
    end
  end

  describe "name" do
    it "nameが存在しなければ登録できない" do
      user = build(:user, name: "")
      expect(user).not_to be_valid
    end

    it "nameが32文字以上の場合登録できない" do
      user = build(:user, name: "a" * 33)
      expect(user).not_to be_valid
    end
  end

  describe "email" do
    it "emailが存在しなければ登録できない" do
      user = build(:user, email: "")
      expect(user).not_to be_valid
    end

    it "@を2個含むemailは無効" do
      user = build(:user, email: "test@@test")
      expect(user).not_to be_valid
    end

    it "emailが他のユーザーと重複したら登録できない" do
      build(:user, email: "test@test.com")
      tester = User.new(email: "test@test.com")
      expect(tester).not_to be_valid
    end

    describe "値の正規化" do
      it "emailに含まれる全角英数字記号を半角に変更" do
        user = create(:user, email: "TEST@TEST")
        expect(user.email).to eq("test@test")
      end

      # it "email前後の全角スペースを除去" do
      #   user = create(:user, email: "\u{3000}test@example.com\u{3000}")
      #   expect(user.email).to eq("test@example.com")
      # end

      # deviseの正規化について
    end
  end

  describe "password" do
    it "passwordがなければ登録できない" do
      @user.password = ""
      expect(@user).not_to be_valid
    end

    it "passwordが6文字以下の場合登録できない" do
      user = build(:user, password: "cavaf")
      expect(user).not_to be_valid
    end

    it "文字列を与えると、passwordは長さの長さ60の文字列になる" do
      user = User.new(password: "cavafva")
      expect(user.encrypted_password).to be_kind_of(String)
      expect(user.encrypted_password.size).to eq(60)
    end
  end
end
