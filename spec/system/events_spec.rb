require 'rails_helper'

describe 'イベントCRUD機能', type: :system do
  # イベントを３件作成する
  1.upto(3) do |num|
    let!("event_#{num}") { FactoryBot.create(:event, name: "イベント#{num}", place: "開催場所#{num}") }
  end

  describe '一覧表示機能' do
    it '作成したイベントが全て表示される' do
      # 一覧ページに移動する
      visit events_path
      # 作成したイベントがあるか確認
      expect(page).to have_content 'イベント1'
      expect(page).to have_content 'イベント2'
      expect(page).to have_content 'イベント3'
    end
  end

  describe 'イベント詳細表示機能' do
    it '詳細1表示確認' do
      visit event_path(event_1)
      expect(page).to have_content '開催場所1'
    end

    it '詳細2表示確認' do
      visit event_path(event_2)
      expect(page).to have_content '開催場所2'
    end
  end

  describe 'イベント編集機能' do
    it '編集登録' do
      visit event_path(event_1)
      click_on '編集'
      fill_in 'event_name', with: '編集したイベント名'
      click_on 'Update Event'
      expect(page).to have_content '編集したイベント名'
    end
  end

  describe 'イベント新規作成' do
    it '新規登録' do
      # 新規登録画面に移動
      visit new_event_path
      # 各種項目を入力する
      fill_in 'event_name', with: '運動会'
      fill_in 'event_place', with: '渋谷区第二広場'
      fill_in 'event_date', with: '2019/07/15'.to_date
      fill_in 'event_start_at', with: '10:00'
      fill_in 'event_end_at', with: '16:00'
      fill_in 'event_cost', with: '1000'
      fill_in 'event_capacity', with: '200'
      fill_in 'event_meta', with: 'お弁当持参してください！'
      # 登録ボタンを押す
      click_on 'Create Event'
      # 登録内容が画面に表示されているか確認する
      visit events_path
      save_and_open_page
      expect(page).to have_content '運動会'
    end
  end

  describe 'イベント削除', js: true do
    it 'イベント2を削除する' do
      # イベント2の詳細画面に移動
      visit event_path(event_2)
      click_on '削除'
      # jsの確認フォームでOKボタンを押す
      page.driver.browser.switch_to.alert.accept
      # 遷移先（一覧画面）で削除コメントが表示されているか確認
      expect(page).to have_content 'イベント2の情報を削除しました'
    end
  end
end