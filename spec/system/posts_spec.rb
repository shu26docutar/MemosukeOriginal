require 'rails_helper'

RSpec.describe 'メモを投稿できるとき', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @post_room = Faker::Lorem.characters(number: 10)
    @post_body = Faker::Lorem.sentence
  end
  it 'ログインしているユーザーは新規投稿できる' do
    sign_in(@user)
        
    expect(page).to have_content('mode')

    find('.icon-area').find('#add-btn').click
    
    expect(page).to have_content('Title:')
    expect(page).to have_content('Body:')

    expect(page).to have_button('保存')
    expect(page).to have_button('中止')
    expect(page).to have_button('リセット')

    fill_in 'post[title]', with: @post_room
    fill_in 'post[body]', with: @post_body

    expect{
      find('#submit-btn').click
    }.to change { Post.count }.by(1)
    
    expect(current_path).to eq(root_path)

    expect(page).to have_content(@post_title)

    expect(page).to have_no_content('Title:')
    expect(page).to have_no_content('Body:')

    expect(page).to have_no_button('保存')
    expect(page).to have_no_button('中止')
    expect(page).to have_no_button('リセット')
  end

  it 'ログインしていないユーザーは投稿ボタンがない' do
    visit root_path
    expect(page).to have_no_content('#face-btn')
  end
end

RSpec.describe 'メモ詳細ページ', type: :system do
  before do
    @post = FactoryBot.create(:post)
  end
  context '詳細表示できるとき' do
    it 'ログインしたユーザーはメモ詳細ページに画面遷移することができる' do
      sign_in(@post.user)

      find('.room-title').click

      expect(page).to have_content('Title:')
      expect(page).to have_content('Body:')
      expect(page).to have_content('削除')
      expect(page).to have_content('戻る')
      expect(page).to have_content('編集')

      find('#back-btn').click

      expect(current_path).to eq(root_path)
    end

    context 'メモ詳細表示できないとき' do
      it '未ログインユーザーはメモ詳細ページに画面遷移できない' do
        visit root_path
        visit post_path(@post)
        expect(current_path).to eq(new_user_session_path)
      end
    end
  end
end

RSpec.describe 'メモ編集', type: :system do
  before do
    @post = FactoryBot.create(:post)
  end
  context 'メモを編集することができるとき' do
    it 'ログインしたユーザが自分のメモを編集することができる' do
      sign_in(@post.user)

      find('.room-title').click

      expect(page).to have_content('Title:')
      expect(page).to have_content('Body:')
      expect(page).to have_content('削除')
      expect(page).to have_content('戻る')
      expect(page).to have_content('編集')

      find('#edit-btn').click

      expect(current_path).to eq(edit_post_path(@post))
      expect(page).to have_content('Title:')
      expect(page).to have_content('Body:')
      expect(page).to have_button('保存')
      expect(page).to have_content('戻る')

      expect(
        find('#post_title').value
      ).to eq(@post.title)

      expect(
        find('#post_body').value
      ).to eq(@post.body)

      fill_in 'post[title]', with: "#{@post.title}"
      fill_in 'post[body]', with: "#{@post.body}+編集したテキスト"

      expect{
        find('input[name="commit"]').click
      }.to change { Post.count }.by(0)

      expect(page).to have_content('Post was successfully updated.')

      expect(current_path).to eq(post_path(@post))

      visit root_path

      expect(page).to have_content(@post_title)
    end
  end
  
  context 'メモを編集することができないとき' do
    it '未ログインユーザはメモ編集ページに画面遷移できない' do
      visit root_path
      visit edit_post_path(@post)
      expect(current_path).to eq(new_user_session_path)
    end
  end
end

RSpec.describe 'メモ削除', type: :system do
  before do
    @post = FactoryBot.create(:post)
  end
  context 'メモを削除することができる' do
    it 'ログインしたユーザーが自分のメモを削除することができるとき' do
      sign_in(@post.user)

      find('.room-title').click

      expect(page).to have_content('Title:')
      expect(page).to have_content('Body:')
      expect(page).to have_content('削除')
      expect(page).to have_content('戻る')
      expect(page).to have_content('編集')

      find('#delete-btn').click

      expect(accept_confirm).to have_content('削除してもよろしいですか?')

      expect(page).to have_content('Post was successfully destroyed.')

      expect(current_path).to eq (posts_path)

      visit root_path

      expect(current_path).to eq (root_path)

      expect(page).to have_no_content("#{@post.title}")
    end
  end

  context 'メモを削除することができない' do
    it '未ログインユーザーはメモを削除することはできない' do
      visit root_path
      visit edit_post_path(@post)
      expect(current_path).to eq(new_user_session_path)
    end
  end
  
end