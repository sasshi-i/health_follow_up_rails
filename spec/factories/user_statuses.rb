FactoryBot.define do
  factory :user_status_created, class: UserStatus do
    id { 1 }
    name { "created" }
  end

  factory :user_status_ok, class: UserStatus do
    id { 16 }
    name { "ok" }
  end

  factory :user_status_exit, class: UserStatus do
    id { 64 }
    name { "exit" }
  end
end

