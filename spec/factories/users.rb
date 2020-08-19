FactoryBot.define do
  factory :user_1, class: User do
    id { 1 }
    email { "test@gmail.com" }
    password { "test" }
    disclose_id { "0lPs2vHb8apb" }
    first_name { "テスト_名" }
    last_name { "テスト_姓" }
    address { "テスト_住所" }
    phone_number { "08011112222" }
    home_remedy_start_on { "2020-01-02" }
    affiliation { "テスト_所属" }
    gender { "male" }
    user_status_id { 16 }
    user_role_id { 1 }
    prefecture_id { 1 }
    created_at { "2020-10-10T04:50:40" }
    updated_at { "2020-10-10T04:50:41" }
  end

  factory :user_manager_1, class: User do
    id { 100 }
    email { "test_1@gmail.com" }
    password { "test" }
    disclose_id { "bLOEqCUcs9Bm" }
    first_name { "テスト_管理者" }
    last_name { "テスト" }
    address { "テスト_住所" }
    phone_number { "08011112232" }
    home_remedy_start_on { "2020-01-02" }
    affiliation { "テスト_所属" }
    gender { "male" }
    user_status_id { 16 }
    user_role_id { 2 }
    prefecture_id { 2 }
    created_at { "2020-10-10T04:50:40" }
    updated_at { "2020-10-10T04:50:41" }
  end
end
