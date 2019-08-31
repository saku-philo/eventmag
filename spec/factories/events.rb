FactoryBot.define do
  factory :event do
    name { 'テストイベント１' }
    place { '渋谷駅前焼き鳥屋' }
    image { '' }
    date { '2019-11-28' }
    start_at { '20:00' }
    end_at { '22:00' }
    link_url {'http://yakitori.com'}
    cost { '3000' }
    capacity { '10' }
    meta { '二次会は未定です。' }
    user
  end
end