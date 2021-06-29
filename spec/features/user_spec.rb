require 'rails_helper'

RSpec.feature 'User' do
  feature "ユーザーの新規登録" do
    scenario '新規登録の成功' do
      visit new_user_registration_path

      fill_in 'ユーザーネーム', with: 'testtest'
      fill_in 'メールアドレス', with: 'foo@example.com'
      fill_in 'パスワード', with: '123456'
      fill_in '確認用パスワード', with: '123456'

      click_on '新規登録'

      expect(page).to have_content 'アカウント登録が完了しました。'
      expect(current_path).to eq users_root_path
    end

    scenario '新規登録の失敗' do
      visit new_user_registration_path

      fill_in 'ユーザーネーム', with: ''
      fill_in 'メールアドレス', with: ''
      fill_in 'パスワード', with: '12346'
      fill_in '確認用パスワード', with: '1'

      click_on '新規登録'

      expect(page).to have_content 'メールアドレスが入力されていません。'
      expect(page).to have_content '確認用パスワードとパスワードの入力が一致しません'
      expect(page).to have_content 'パスワードは6文字以上で入力してください'
      expect(page).to have_content 'ユーザーネームが入力されていません。'
      expect(current_path).to eq user_registration_path
    end
  end
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
      expect(current_path).to eq new_user_session_path
    end
  end

  feature "ユーザーの更新" do
    include FeaturesSpecHelper

    background do
      login_as_user
    end

    scenario '更新する(パスワードの変更なし)' do
      visit edit_user_registration_path

      fill_in 'ユーザーネーム', with: 'testtest'
      fill_in 'メールアドレス', with: 'foo2@example.com'
      fill_in '現在のパスワード', with: '123456'

      click_on '保存'

      expect(page).to have_content 'アカウント情報を変更しました。'
      expect(current_path).to eq users_user_path(@user)
    end

    scenario '更新する(パスワードの変更)' do
      visit edit_user_registration_path

      fill_in 'ユーザーネーム', with: 'testtest'
      fill_in 'メールアドレス', with: 'foo2@example.com'
      check 'パスワードを変更する'
      fill_in 'パスワード', with: 'testtest'
      # fill_in '確認用パスワード', with: 'testtest'
      fill_in '現在のパスワード', with: '123456'

      click_on '保存'

      expect(page).to have_content 'アカウント情報を変更しました。'
      expect(current_path).to eq users_user_path(@user)
    end

    scenario '更新に失敗する(パスワードの変更なし)' do
      visit edit_user_registration_path

      fill_in 'ユーザーネーム', with: 'testtest'
      fill_in 'メールアドレス', with: 'foo2@example.com'
      fill_in '現在のパスワード', with: '12345'

      click_on '保存'

      expect(page).to have_content '現在のパスワードが無効です。'
      expect(current_path).to eq user_registration_path
    end
  end
end
