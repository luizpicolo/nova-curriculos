module UserHelpers
  def sign_in(user, options = {})
    password = options[:password] || user.password

    visit root_path

    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: password
    click_button 'Entrar'
  end

  def sign_out
    click_link 'Sair'
  end

  def create_user(user, options = {})
    password_confirmation = options[:password_confirmation] || user.password
    email = options[:email] || user.email

    if options[:candidate]
      visit registration_candidate_path
    else
      visit registration_recruiter_path
    end

    fill_in 'user_name_r', with: user.name
    fill_in 'user_email_r', with: email
    fill_in 'user_password_r', with: user.password
    fill_in 'user_password_confirmation_r', with: password_confirmation
    click_button 'Cadastrar'
  end
end

RSpec.configure do |config|
  config.include UserHelpers, :type => :feature
end
