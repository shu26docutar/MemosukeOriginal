require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe 'メモ投稿' do
    context 'メモ投稿ができる場合' do
      it 'titleとbodyがあれば投稿できる' do
        expect(@post).to be_valid
      end

      it 'bodyなしでも投稿できる' do
        @post.body = nil
        expect(@post).to be_valid
      end

      it 'titleが10文字以内なら投稿できる' do
        @post.title = 'aaaaaaaaaa'
        expect(@post).to be_valid
      end
    end

    context 'メモ投稿ができない場合' do
      it 'titleが空では投稿できない' do
        @post.title = nil
        @post.valid?
        expect(@post.errors.full_messages).to include 'Titleを入力してください'
      end

      it 'titleが10以上では投稿できない' do
        @post.title = 'aaaaaaaaaaa'
        @post.valid?
        expect(@post.errors.full_messages).to include 'Titleは10文字以内で入力してください'
      end

      it '登録していないユーザーは投稿できない' do
        @post.user_id = nil
        @post.valid?
        expect(@post.errors.full_messages).to include 'Userを入力してください'
      end
    end
  end
end
