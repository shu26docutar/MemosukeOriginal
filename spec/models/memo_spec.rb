require 'rails_helper'

RSpec.describe Memo, type: :model do
  before do
    @memo = FactoryBot.build(:memo)
  end
  
  describe "メモ投稿" do
    context "メモ投稿がうまくいく場合" do
      it "titleとcontentがあれば投稿できる" do
        expect(@memo).to be_valid
      end

      it "contentなしても投稿できる" do
        @memo.content = nil
        expect(@memo).to be_valid
      end

      it "titleが10文字以内なら投稿できる" do
        @memo.title = "aaaaaaaaaa"
        expect(@memo).to be_valid
      end
    end

    context "メモ投稿がうまくいかない場合" do
      it "titleが空では投稿できない" do
        @memo.title = nil
        @memo.valid?
        expect(@memo.errors.full_messages).to include "Title can't be blank"
      end

      it "titleが10以上であれば投稿できない" do
        @memo.title = "aaaaaaaaaaa"
        @memo.valid?
        expect(@memo.errors.full_messages).to include "Title is too long (maximum is 10 characters)"
      end
    end
  end
end
