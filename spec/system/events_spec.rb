require 'rails_helper'

RSpec.describe 'スケジュール', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @event = FactoryBot.build(:event)
  end

  context 'スケジュールが登録できるとき' do
    it 'ログインしているユーザーがスケジュールを作成できるとき' do
      sign_in(@user)
      
      expect(page).to have_content('translation missing: ja.devise.sessions.user.signed_in') 
      expect(page).to have_content('add')

      find('.events-btn').click

      expect(current_path).to eq (new_event_path)

      expect(page).to have_content('メモ')
      expect(page).to have_content('場所')
      expect(page).to have_content('URL')
      expect(page).to have_content('戻る')
      expect(page).to have_button('保存')

      fill_in 'event[title]',	with: @event.title
      fill_in 'event[plan]', with: @event.plan

      find('.btn-comment').click
      fill_in 'event[comment]', with: @event.comment

      find('.btn-place').click
      fill_in 'event[place]', with: @event.place

      find('.btn-url').click
      fill_in 'event[url]', with: @event.url

      select '2021', from:'event[start_time(1i)]'
      select '3', from:'event[start_time(2i)]'
      select '1', from:'event[start_time(3i)]'
      select '10', from:'event[start_time(4i)]'
      select '10', from:'event[start_time(5i)]'

      expect{
        find('#submit-btn').click
      }.to change { Event.count }.by(1)

      expect(current_path).to eq (root_path)

      expect(page).to have_content(@event_title)
    end
  end

  context 'スケジュール登録できないとき' do
    it 'ログインしていないユーザーは登録ボタンがない' do
      visit root_path
      expect(page).to have_no_content('#add-btn')
      visit new_event_path
      expect(current_path).to eq (new_user_session_path) 
    end
  end
end
