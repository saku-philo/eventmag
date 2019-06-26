require 'rails_helper'

describe 'イベントCRUD機能', type: :system do
  # ユーザーAを作成
  let!(:user_a) { FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com', uid: 'a_string', admin: true  ) }
  # ユーザーBを作成
  let!(:user_b) { FactoryBot.create(:user, name: 'ユーザーB', email: 'b@example.com', uid: 'b_string' ) }

  # イベントを３件ユーザーAで作成する
  1.upto(3) do |num|
    let!("event_#{num}") { FactoryBot.create(:event, name: "イベント#{num}", place: "開催場所#{num}", user: user_a) }
  end

  before do
    # 登録したユーザーでログインする
    visit user_session_path
    fill_in 'user_email', with: login_user.email
    fill_in 'user_password', with: login_user.password
    click_button 'ログイン'
  end

  describe '権限者は管理画面に入れる' do
    let(:login_user) { user_a }
    it '管理者画面ログイン' do
      # 管理者画面に移動する
      visit rails_admin_path
      # 正常に入れているかを確認
      expect(page).to have_content 'サイト管理'
    end
  end

  describe '権限者以外は管理画面に入れない' do
    let(:login_user) { user_b }
    it '管理者画面ログイン' do
      # 管理者画面に移動する
      visit rails_admin_path
      # 管理者画面に入れていない事を確認
      expect(page).not_to have_content 'サイト管理'
    end
  end
end