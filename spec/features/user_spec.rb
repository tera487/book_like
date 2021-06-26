require 'rails_helper'

RSpec.feature 'User' do
  feature "ユーザーのログイン" do
    background do
      User.create!(name: "test", email: 'foo@example.com', password: '123456')
    end

    scenario 'ログインする' do
      visit new_user_session_path

      fill_in 'メールアドレス', with: 'foo@example.com'
      fill_in 'パスワード', with: '123456'

      click_on 'ログイン'

      expect(page).to have_content 'ログインしました'
    end

    scenario 'ログインに失敗する' do
      visit new_user_session_path

      fill_in 'メールアドレス', with: 'foo@example.com'
      fill_in 'パスワード', with: '12346'

      click_on 'ログイン'

      expect(page).to have_content 'メールアドレスまたはパスワードが違います。'
    end
  end

  feature "ユーザーの更新" do
    include FeaturesSpecHelper

    background do
      login_as_user
    end

    scenario '更新する' do
      visit edit_user_registration_path

      fill_in 'ユーザーネーム', with: 'testtest'
      fill_in 'メールアドレス', with: 'foo2@example.com'
      fill_in '現在のパスワード', with: '123456'

      click_on '保存'

      # expect(page).to have_content '更新しました'
      expect(current_path).to eq users_user_path(@user)
    end

    scenario '更新に失敗する' do
      visit edit_user_registration_path

      fill_in 'ユーザーネーム', with: 'testtest'
      fill_in 'メールアドレス', with: 'foo2@example.com'
      fill_in '現在のパスワード', with: '12345'

      click_on '保存'

      expect(page).to have_content '現在のパスワードが無効です。'
      # expect(current_path).to eq edit_user_registration_path
    end
  end
end
