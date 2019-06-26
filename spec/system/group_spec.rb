require 'rails_helper'

describe 'グループ管理機能', type: :system do
  # ユーザーAを作成
  let!(:user_a) { FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com', uid: 'a_string' ) }
  # ユーザーBを作成
  let!(:user_b) { FactoryBot.create(:user, name: 'ユーザーB', email: 'b@example.com', uid: 'b_string' ) }

  before do
    # 登録したユーザーでログインする
    visit user_session_path
    fill_in 'user_email', with: login_user.email
    fill_in 'user_password', with: login_user.password
    click_button 'ログイン'
  end

  describe 'グループ作成機能' do
    let(:login_user) { user_a }
    it 'グループ作成' do
      # グループ作成ページに移動する
      visit new_group_path
      # 必要項目を入力する
      fill_in 'group_name', with: 'グループ１'
      fill_in 'group_summary', with: '初のグループです'
      # 登録ボタンを押す
      click_button '登録'
      # 登録内容が画面に表示されているか確認する
      expect(page).to have_content 'グループ１'
    end

    it 'グループ編集' do
      # グループ作成ページに移動する
      visit new_group_path
      # 必要項目を入力する
      fill_in 'group_name', with: 'グループ２'
      fill_in 'group_summary', with: '２番目のグループです'
      # 登録ボタンを押す
      click_button '登録'
      # 編集ページに移動する
      click_on 'グループ編集'
      fill_in 'group_name', with: '編集グループ２'
      click_button '登録'
      # 編集内容が反映されているか確認
      expect(page).to have_content '編集グループ２'
    end

    it 'グループ削除' do
      # グループ作成ページに移動する
      visit new_group_path
      # 必要項目を入力する
      fill_in 'group_name', with: 'グループ３'
      fill_in 'group_summary', with: '３番目のグループです'
      # 登録ボタンを押す
      click_button '登録'
      # 編集ページに移動する
      click_on 'グループ削除'
      # JSの確認フォームでOKを押す
      page.driver.browser.switch_to.alert.accept
      # 削除したグループが表示されていないか確認
      expect(page).not_to have_content 'グループ３'
    end
  end
end
