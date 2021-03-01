require 'rails_helper'

RSpec.describe 'スケジュール', type: :system do
  before do
    @event = FactoryBot.build(:event)
  end

  context 'スケジュールが登録できるとき' do
    it 'ログインしているユーザーがスケジュールを作成できるとき' do
      sign_in(@event.user)
      expect(page).to have_content('add')
      find('events-btn').click
      expect(current_path).to (new_event_path)
      expect(page).to have_content('メモ')
      expect(page).to have_content('場所')
      expect(page).to have_content('URL')
      expect(page).to have_content('戻る')
      expect(page).to have_button('保存')
    end
  end
end
