require 'rails_helper'

RSpec.describe '新規登録', type: :system do
  before do
    @user = FactoryBot.build(:user)
  end

  context 'ユーザー新規登録ができるとき' do
    it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
      visit root_path

      expect(
        find('.icon-area').find('#face-btn').hover
      ).to have_content('face')

      expect(page).to have_content('サインイン')

      visit new_user_registration_path

      fill_in 'Name', with: @user.name
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      fill_in 'Password confirmation', with: @user.password_confirmation

      select '1970', from: 'user[birthday(1i)]'
      select '1', from: 'user[birthday(2i)]'
      select '1', from: 'user[birthday(3i)]'

      expect do
        find('input[name="commit"]').click
      end.to change { User.count }.by(1)

      expect(current_path).to eq(root_path)

      expect(
        find('.icon-area').find('#face-btn').hover
      ).to have_content('face')

      expect(page).to have_content('詳細')
      expect(page).to have_content('編集')
      expect(page).to have_content('ログアウト')

      expect(page).to have_no_content('ログイン')
      expect(page).to have_no_content('サインイン')
    end
  end

  context 'ユーザー新規登録ができないとき' do
    it '誤った情報ではユーザー新規登録ができずに新規登録ページへ戻ってくる' do
      visit root_path

      expect(
        find('.icon-area').find('#face-btn').hover
      ).to have_content('face')

      expect(page).to have_content('サインイン')

      visit new_user_registration_path

      fill_in 'Name', with: ' '
      fill_in 'Email', with: ' '
      fill_in 'Password', with: ' '
      fill_in 'Password confirmation', with: ' '

      select '--', from: 'user[birthday(1i)]'
      select '--', from: 'user[birthday(2i)]'
      select '--', from: 'user[birthday(3i)]'

      expect do
        find('input[name="commit"]').click
      end.to change { User.count }.by(0)

      expect(current_path).to eq('/users')
    end
  end
end

RSpec.describe 'ログイン', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end

  context 'ユーザーログインができるとき' do
    it '正しい情報を入力すればユーザーログインができてトップページに移動する' do
      visit root_path

      expect(
        find('.icon-area').find('#face-btn').hover
      ).to have_content('face')

      expect(page).to have_content('ログイン')

      visit new_user_session_path

      fill_in 'Email',	with: @user.email
      fill_in 'Password', with: @user.password

      find('input[name="commit"]').click

      expect(current_path).to eq(root_path)

      expect(
        find('.icon-area').find('#face-btn').hover
      ).to have_content('face')

      expect(page).to have_content('詳細')
      expect(page).to have_content('編集')
      expect(page).to have_content('ログアウト')

      expect(page).to have_no_content('ログイン')
      expect(page).to have_no_content('サインイン')
    end
  end

  context 'ログインができないとき' do
    it '保存されているユーザーの情報と合致しないとログインができない' do
      visit root_path

      expect(
        find('.icon-area').find('#face-btn').hover
      ).to have_content('face')

      expect(page).to have_content('ログイン')

      visit new_user_session_path

      fill_in 'Email', with: ''
      fill_in 'Password', with: ''

      find('input[name="commit"]').click

      expect(current_path).to eq(new_user_session_path)
    end
  end
end
