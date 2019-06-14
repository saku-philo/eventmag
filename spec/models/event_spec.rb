require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'name登録' do
    it 'nameが空だとバリデーションが通らない' do
      event = FactoryBot.build(:event, name: '')
      expect(event).not_to be_valid
    end

    it 'nameが空でなければバリデーションが通る' do
      event = FactoryBot.build(:event)
      expect(event).to be_valid
    end

    it 'nameが101文字以上だとバリデーションが通らない' do
      event = FactoryBot.build(:event, name: "#{ 'の' * 101 }")
      expect(event).not_to be_valid
    end

    it 'nameが100文字以内だとバリデーションが通る' do
      event = FactoryBot.build(:event, name: "#{ 'の' * 100 }")
      expect(event).to be_valid
    end
  end

  describe 'place登録' do
    it 'placeが空だとバリデーションが通らない' do
      event = FactoryBot.build(:event, place: '')
      expect(event).not_to be_valid
    end

    it 'placeが空でなければバリデーションが通る' do
      event = FactoryBot.build(:event)
      expect(event).to be_valid
    end
  end

  describe 'date登録' do
    it 'dateが空だとバリデーションが通らない' do
      event = FactoryBot.build(:event, date: '')
      expect(event).not_to be_valid
    end

    it 'dateが空でなければバリデーションが通る' do
      event = FactoryBot.build(:event)
      expect(event).to be_valid
    end
  end

  describe 'start_at登録' do
    it 'start_atが空だとバリデーションが通らない' do
      event = FactoryBot.build(:event, start_at: '')
      expect(event).not_to be_valid
    end

    it 'start_atが空でなければバリデーションが通る' do
      event = FactoryBot.build(:event)
      expect(event).to be_valid
    end
  end

  describe 'cost登録' do
    it 'costが空だとバリデーションが通らない' do
      event = FactoryBot.build(:event, cost: '')
      expect(event).not_to be_valid
    end

    it 'costが空でなければバリデーションが通る' do
      event = FactoryBot.build(:event)
      expect(event).to be_valid
    end
  end

  describe 'capacity登録' do
    it 'capacityが空だとバリデーションが通らない' do
      event = FactoryBot.build(:event, capacity: '')
      expect(event).not_to be_valid
    end

    it 'capacityが空でなければバリデーションが通る' do
      event = FactoryBot.build(:event)
      expect(event).to be_valid
    end
  end
end