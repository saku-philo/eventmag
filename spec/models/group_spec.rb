require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'name登録' do
    it 'nameが空だとバリデーションが通らない' do
      group = FactoryBot.build(:group, name: '')
      expect(group).not_to be_valid
    end

    it 'nameが空でなければバリデーションが通る' do
      group = FactoryBot.build(:group)
      expect(group).to be_valid
    end

    it 'nameが51文字以上だとバリデーションが通らない' do
      group = FactoryBot.build(:group, name: "#{ 'い' * 51 }")
      expect(group).not_to be_valid
    end

    it 'nameが50文字以内だとバリデーションが通る' do
      group = FactoryBot.build(:group, name: "#{ 'い' * 50 }")
      expect(group).to be_valid
    end
  end

  describe 'グループ概要登録' do
    it 'summaryが空だとバリデーションが通らない' do
      group = FactoryBot.build(:group, summary: '')
      expect(group).not_to be_valid
    end

    it 'summaryが空でなければバリデーションが通る' do
      group = FactoryBot.build(:group)
      expect(group).to be_valid
    end
  end
end