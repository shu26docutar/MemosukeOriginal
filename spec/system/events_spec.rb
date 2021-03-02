require 'rails_helper'

RSpec.describe 'スケジュール投稿', type: :system do
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
      select '2', from:'event[start_time(3i)]'
      select '10', from:'event[start_time(4i)]'
      select '10', from:'event[start_time(5i)]'

      expect{
        find('#submit-btn').click
      }.to change { Event.count }.by(1)

      expect(current_path).to eq (root_path)

      expect(page).to have_content(@event_title)
      
      # 詳細ページの画面遷移
      find('.event-name').click
      
      expect(page).to have_content('Title :')
      expect(page).to have_content("#{@event_title}")
      expect(page).to have_content('Schedule Time :')
      expect(page).to have_content("#{@schedule_time}")
      expect(page).to have_content('Plan :')
      expect(page).to have_content("#{@event_plan}")
      expect(page).to have_content("Comment :")
      expect(page).to have_content("#{@event_comment}")
      expect(page).to have_content('Place :') 
      expect(page).to have_content("#{@event_place}") 
      expect(page).to have_content('Url :')
      expect(page).to have_content("#{@event_url}")

      expect(page).to have_content('編集')
      expect(page).to have_content('戻る')
      expect(page).to have_content('削除')

      find('#back-btn').click

      expect(current_path).to eq (root_path) 

      # 編集ページの遷移
      find('.event-name').click

      expect(page).to have_content('編集')
      expect(page).to have_content('戻る')
      expect(page).to have_content('削除')

      find('#edit-btn').click

      fill_in 'event[title]',	with: "#{@post_title}+編集したテキスト"
      fill_in 'event[plan]',	with: "#{@post_plan}+編集したテキスト"

      find('.btn-comment').click
      fill_in 'event[comment]',	with: "#{@post_comment}+編集したテキスト"

      find('.btn-place').click
      fill_in 'event[comment]',	with: "#{@post_comment}+編集したテキスト"

      find('.btn-url').click
      fill_in 'event[comment]',	with: "#{@post_comment}+編集したテキスト"

      expect{
        find('input[name="commit"]').click
      }.to change { Event.count }.by(0)

      find('#back-btn').click

      expect(current_path).to eq (root_path) 

      # スケジュール削除
      find('.event-name').click
      find('#delete-btn').click
      expect(accept_confirm).to have_content('削除してもよろしいですか?')
      
      expect(current_path).to eq (root_path)

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

  context 'スケジュール詳細ページ' do
    it '未ログインユーザーは詳細ページに画面遷移できない・削除することもできない' do
      visit root_path
      expect(page).to have_no_content('.event-name')
    end
  end
end
