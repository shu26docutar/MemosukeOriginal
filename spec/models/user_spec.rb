require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいく場合' do
      it 'nameとemailとpasswordとbirthdayがあれば登録ができる' do
        expect(@user).to be_valid
      end

      it 'passwordが6文字以上であれば登録できること' do
        @user.password = 'a00000'
        @user.password_confirmation = 'a00000'
        expect(@user).to be_valid
      end
    end

    context "新規登録がいまくいかない場合" do
      it 'nameが空だと登録できない' do
        @user.name = nil
        @user.valid?  
        expect(@user.errors.full_messages).to include "Name can't be blank"
      end

      it 'emailが空では登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end

      it 'emailの@が空であれば登録ができない' do
        @user.email = 'testtest'
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end

      it 'emailが重複すれば登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include 'Email has already been taken'
      end

      it 'passwordが空では登録できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include "Password は半角英数字で入力してください"
      end

      it 'passwordが全角であれば登録できないこと' do
        @user.password = 'ａ０００００'
        @user.password_confirmation = 'ａ００００００'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password は半角英数字で入力してください'
      end

      it 'passwordが数字のみでは登録できないこと' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password は半角英数字で入力してください'
      end

      it 'passwordが英語のみでは登録できないこと' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password は半角英数字で入力してください'
      end

      it 'passwordが5文字以下であれば登録できない' do
        @user.password = 'a0000'
        @user.password_confirmation = 'a0000'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password は半角英数字で入力してください"
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'a00000'
        @user.password_confirmation = 'a11111'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it 'birthdayがなければ登録できない' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
    end
  end
end