module SessionSpecHelper
  def sign_up(user)
    visit new_user_path
    fill_in 'User name', with: 'Orest'
    click_on 'Login'
  end
end