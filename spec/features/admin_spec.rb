require 'rails_helper'

RSpec.feature 'Admin' do
  feature "ユーザーのログイン" do
    background do
      Admin.create!(name: "test", email: 'foo@example.com', password: '123456')
    end

    scenario 'ログインする' do
      visit new_admin_session_path

      fill_in 'メールアドレス', with: 'foo@example.com'
      fill_in 'パスワード', with: '123456'

      click_on 'ログイン'

      expect(page).to have_content 'ログインしました'
    end

    scenario 'ログインに失敗する' do
      visit new_admin_session_path

      fill_in 'メールアドレス', with: 'foo@example.com'
      fill_in 'パスワード', with: '12346'

      click_on 'ログイン'

      expect(page).to have_content 'メールアドレスまたはパスワードが違います。'
      expect(current_path).to eq new_admin_session_path
    end
  end

  # feature "adminの更新" do
  #   include FeaturesSpecHelper

  #   background do
  #     login_as_admin
  #   end

  #   scenario '更新する(パスワードの変更なし)' do
  #     visit edit_admin_registration_path

  #     fill_in '管理者', with: 'testtest'
  #     fill_in 'メールアドレス', with: 'foo2@example.com'
  #     fill_in '現在のパスワード', with: '123456'

  #     click_on '保存'

  #     # expect(page).to have_content 'アカウント情報を変更しました。'
  #     expect(current_path).to eq admins_admin_path(@admin)
  #   end

  #   scenario '更新する(パスワードの変更)' do
  #     visit edit_admin_registration_path

  #     fill_in '管理者', with: 'testtest'
  #     fill_in 'メールアドレス', with: 'foo2@example.com'
  #     check 'パスワードを変更する'
  #     fill_in 'パスワード', with: 'testtest'
  #     # fill_in '確認用パスワード', with: 'testtest'
  #     fill_in '現在のパスワード', with: '123456'

  #     click_on '保存'

  #     # expect(page).to have_content 'アカウント情報を変更しました。'
  #     expect(current_path).to eq admins_admin_path(@admin)
  #   end

  #   scenario '更新に失敗する(パスワードの変更なし)' do
  #     visit edit_admin_registration_path

  #     fill_in '管理者', with: 'testtest'
  #     fill_in 'メールアドレス', with: 'foo2@example.com'
  #     fill_in '現在のパスワード', with: '12345'

  #     click_on '保存'

  #     expect(page).to have_content '現在のパスワードが無効です。'
  #     expect(current_path).to eq admin_registration_path
  #   end
  # end
end
