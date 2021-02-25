require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe 'メモ投稿' do
    context 'メモ投稿がうまくいく場合' do
      it 'titleとbodyがあれば投稿できる' do
        expect(@post).to be_valid
      end

      it 'bodyなしても投稿できる' do
        @post.body = nil
        expect(@post).to be_valid
      end

      it 'titleが10文字以内なら投稿できる' do
        @post.title = 'aaaaaaaaaa'
        expect(@post).to be_valid
      end
    end

    context 'メモ投稿がうまくいかない場合' do
      it 'titleが空では投稿できない' do
        @post.title = nil
        @post.valid?
        expect(@post.errors.full_messages).to include "Title can't be blank"
      end

      it 'titleが10以上であれば投稿できない' do
        @post.title = 'aaaaaaaaaaa'
        @post.valid?
        expect(@post.errors.full_messages).to include 'Title is too long (maximum is 10 characters)'
      end
    end
  end
end
