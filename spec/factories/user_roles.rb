FactoryBot.define do
  factory :user_role_user, class: UserRole do
    id { 1 }
    name { "user" }
  end

  factory :user_role_manager, class: UserRole do
    id { 2 }
    name { "manager" }
  end

  factory :user_role_admin, class: UserRole do
    id { 3 }
    name { "admin" }
  end
end

