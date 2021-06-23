require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @user = create(:user)
    @book = create(:book)
  end
  
  describe "登録" do
    it "すべての値が正しく入力されていれば登録できる" do
      post = build(:post, user_id: @user.id, book_id: @book.id)
      expect(post).to be_valid
    end
  end
  
  describe "感想" do
    it "cententが存在しなければ登録できない" do
      post = build(:post, user_id: @user.id, book_id: @book.id, content: "")
      expect(post).not_to be_valid
    end
    
    it "contentが255文字以上の場合登録できない" do
      post = build(:post, user_id: @user.id, book_id: @book.id, content: "a" * 256)
      expect(post).not_to be_valid
    end

  end
end
