require 'rails_helper'

RSpec.describe Admin, type: :model do
  before do
    @admin = build(:admin)
  end

  describe "登録" do
    it "すべての値が正しく入力されていれば登録できる" do
      expect(@admin).to be_valid
    end
  end

  describe "name" do
    it "nameが存在しなければ登録できない" do
      admin = build(:admin, name: "")
      expect(admin).not_to be_valid
    end

    it "nameが32文字以上の場合登録できない" do
      admin = build(:admin, name: "a" * 33)
      expect(admin).not_to be_valid
    end
  end

  describe "email" do
    it "emailが存在しなければ登録できない" do
      admin = build(:admin, email: "")
      expect(admin).not_to be_valid
    end

    it "@を2個含むemailは無効" do
      admin = build(:admin, email: "test@@test")
      expect(admin).not_to be_valid
    end

    it "emailが他のユーザーと重複したら登録できない" do
      build(:admin, email: "test@test.com")
      tester = Admin.new(email: "test@test.com")
      expect(tester).not_to be_valid
    end

    describe "値の正規化" do
      it "emailに含まれる全角英数字記号を半角に変更" do
        admin = create(:admin, email: "TEST@TEST")
        expect(admin.email).to eq("test@test")
      end

      # it "email前後の全角スペースを除去" do
      #   admin = create(:admin, email: "\u{3000}test@example.com\u{3000}")
      #   expect(admin.email).to eq("test@example.com")
      # end

      # deviseの正規化について
    end
  end

  describe "password" do
    it "passwordがなければ登録できない" do
      @admin.password = ""
      expect(@admin).not_to be_valid
    end

    it "passwordが6文字以下の場合登録できない" do
      admin = build(:admin, password: "cavaf")
      expect(admin).not_to be_valid
    end

    it "文字列を与えると、passwordは長さの長さ60の文字列になる" do
      admin = Admin.new(password: "cavafva")
      expect(admin.encrypted_password).to be_kind_of(String)
      expect(admin.encrypted_password.size).to eq(60)
    end
  end
end
