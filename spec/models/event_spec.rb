require 'rails_helper'

RSpec.describe Event, type: :model do
  before do
    @event = FactoryBot.build(:event)
  end

  describe 'event機能' do
    context 'スケジュール登録ができる場合' do
      it 'title/plan/comment/url/place/start_time/user_idが全てあれば登録ができる' do
        expect(@event).to be_valid
      end

      it 'titleとstar_timeだけで登録ができる' do
        @event.plan = nil
        @event.comment = nil
        @event.url = nil
        @event.place = nil
        expect(@event).to be_valid
      end
    end

    context 'スケジュールが登録できない場合' do
      it 'titleが空では登録できない' do
        @event.title = nil
        @event.valid?
        expect(@event.errors.full_messages).to include 'Titleを入力してください'
      end

      it 'start_timeが空では登録できない' do
        @event.start_time = nil
        @event.valid?
        expect(@event.errors.full_messages).to include 'Start timeを入力してください'
      end

      it '登録していないユーザーは投稿できない' do
        @event.user_id = nil
        @event.valid?
        expect(@event.errors.full_messages).to include 'Userを入力してください'
      end
    end
  end
end
