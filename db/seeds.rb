# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



UserStatus.destroy_all
UserRole.destroy_all

FactoryBot.create(:user_role_user)
FactoryBot.create(:user_role_manager)
FactoryBot.create(:user_role_admin)
FactoryBot.create(:user_status_created)
FactoryBot.create(:user_status_ok)
FactoryBot.create(:user_status_exit)

