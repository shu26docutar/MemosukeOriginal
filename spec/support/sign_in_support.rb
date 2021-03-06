module SignInSupport
  def sign_in(user)
    visit root_path
    expect(
      find('.icon-area').find('#face-btn').hover
    ).to have_content('face')
    expect(page).to have_content('ログイン')
    visit new_user_session_path
    fill_in 'Email',	with: user.email
    fill_in 'Password', with: user.password
    find('input[name="commit"]').click
    expect(current_path).to eq(root_path)
  end
end
