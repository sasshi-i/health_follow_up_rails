# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



UserStatus.destroy_all
UserRole.destroy_all
User.destroy_all
AnswerOption.destroy_all
AnswerContent.destroy_all
Answer.destroy_all
Question.destroy_all
QuestionType.destroy_all

FactoryBot.create(:user_role_user)
FactoryBot.create(:user_role_manager)
FactoryBot.create(:user_role_admin)
FactoryBot.create(:user_status_created)
FactoryBot.create(:user_status_ok)
FactoryBot.create(:user_status_exit)
FactoryBot.create(:user_1)
FactoryBot.create(:user_manager_1)

FactoryBot.create(:question_type_input_numeric)
FactoryBot.create(:question_type_input_text)
FactoryBot.create(:question_type_input_option)

FactoryBot.create(:question_numeric_1)
FactoryBot.create(:question_text_1)
FactoryBot.create(:question_option_1)

FactoryBot.create(:answer_option_1_question_option_1)
FactoryBot.create(:answer_option_2_question_option_1)
FactoryBot.create(:answer_option_3_question_option_1)

FactoryBot.create(:answer_1_user_1)

FactoryBot.create(:answer_content_1_question_numeric_1)
FactoryBot.create(:answer_content_1_question_text_1)
FactoryBot.create(:answer_content_1_question_option_1)
