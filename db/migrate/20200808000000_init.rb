require "csv"
class Init < ActiveRecord::Migration[5.0]
  def change
    create_table "emergency_contact".pluralize do |t|
      t.string :name, limit: 100, null: false
      t.integer :phone_number, null: false

      t.timestamps
    end
    add_index "emergency_contact".pluralize, :phone_number, unique: true

    create_table "notification_email".pluralize do |t|
      t.string :email, limit: 128, null: false

      t.timestamps
    end
    add_index "notification_email".pluralize, :email, unique: true

    create_table "mail_template".pluralize do |t|
      t.string :name, limit: 100, null: false
      t.string :template, limit: 1000, null: false
      t.boolean :is_deleted, null: false, default: false

      t.timestamps
    end
    add_index "mail_template".pluralize, :name, unique: true

    create_table "user_status".pluralize do |t|
      t.string :name, limit: 45, null: false

      t.timestamps
    end
    add_index "user_status".pluralize, :name, unique: true

    create_table "user_role".pluralize do |t|
      t.string :name, limit: 45, null: false

      t.timestamps
    end
    add_index "user_role".pluralize, :name, unique: true

    create_table "prefecture".pluralize do |t|
      t.string :name, limit: 45, null: false
      t.integer :display_order, null: false

      t.timestamps
    end
    add_index "prefecture".pluralize, :name, unique: true
    csv_data = CSV.read("db/master_data/prefectures.csv", headers: true)
    csv_data.each do |data|
      Prefecture.create!(data.to_hash)
    end

    create_table "user".pluralize do |t|
      t.string :disclose_id, limit: 12, null: false
      t.string :first_name, limit: 255, null: false
      t.string :last_name, limit: 255, null: false
      t.string :gender, limit: 10, null: false
      t.string :address, limit: 511, null: false
      t.integer :phone_number, null: false
      t.datetime :home_remedy_start_at
      t.string :affiliation, limit: 128
      t.integer :user_status_id, null: false
      t.integer :user_role_id, null: false
      t.integer :prefecture_id, null: false

      t.timestamps
    end
    add_index "user".pluralize, :disclose_id, unique: true
    add_reference :users, :user_statuses, foreign_key: true
    add_reference :users, :user_roles, foreign_key: true
    add_reference :users, :prefectures, foreign_key: true

    create_table "referral_hospital".pluralize do |t|
      t.integer :user_id, null: false
      t.string :hospital_name, limit: 255, null: false
      t.string :referral_status, limit: 1000

      t.timestamps
    end
    add_reference :referral_hospitals, :users, foreign_key: true

    create_table "question_type".pluralize do |t|
      t.string :name, limit: 45, null: false

      t.timestamps
    end
    add_index "question_type".pluralize, :name, unique: true

    create_table "question".pluralize do |t|
      t.string :content, limit: 300, null: false
      t.integer :question_type, bull: false
      t.boolean :is_deleted, null: false, default: false

      t.timestamps
    end
    add_reference :questions, :question_types, foreign_key: true

    create_table "answer_option".pluralize do |t|
      t.integer :question, null: false
      t.string :content, limit: 100, null: false
      t.boolean :is_alert, null: false, default: false
      t.boolean :is_deleted, null: false, default: false

      t.timestamps
    end
    add_reference :answer_options, :questions, foreign_key: true

    create_table "answer_time".pluralize do |t|
      t.timestamps
    end

    create_table "answer".pluralize do |t|
      t.integer :user_id, null: false
      t.integer :answer_option_id
      t.integer :question_id, null: false
      t.string :content, limit: 511
      t.string :referral_status, limit: 1000
      t.references :answer_time, null: false
    end
    add_reference :answers, :users, foreign_key: true
    add_reference :answers, :answer_options, foreign_key: true
    add_reference :answers, :questions, foreign_key: true
    add_reference :answers, :answer_times, foreign_key: true

    create_table "answer_comment".pluralize do |t|
      t.string :comment, limit: 511
      t.datetime :answer_confirmed_at, null: false
      t.integer :answer_confirmed_user, null: false
      t.integer :answer_time_id, null: false

      t.timestamps
    end
    add_reference :answer_comments, :answer_confirmed_user, foreign_key: { to_table: :users}
    add_reference :answer_comments, :answer_times, foreign_key: true
  end
end
