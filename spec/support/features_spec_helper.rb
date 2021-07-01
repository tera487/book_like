module FeaturesSpecHelper
  def login_as_user
    @user = User.create!(name: "test", email: 'foo@example.com', password: '123456')
    visit new_user_session_path

    fill_in 'メールアドレス', with: 'foo@example.com'
    fill_in 'パスワード', with: '123456'

    click_on 'ログイン'
  end

  def guest_as_user
    visit root_path
    click_on 'ゲストログイン（閲覧用）'
  end
end
