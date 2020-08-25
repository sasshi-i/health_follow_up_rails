require "csv"
class Init < ActiveRecord::Migration[5.0]
  def change
    create_table "emergency_contact".pluralize do |t|
      t.string :name, limit: 100, null: false
      t.string :phone_number, limit: 11

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
      t.string :email, limit: 255, null: false
      t.string :password_digest, limit: 511, null: false
      t.string :disclose_id, limit: 12, null: false
      t.string :first_name, limit: 255, null: false
      t.string :last_name, limit: 255, null: false
      t.string :gender, limit: 10, null: false
      t.string :address, limit: 511, null: false
      t.string :phone_number, limit: 11, null: false
      t.date :home_remedy_start_on
      t.date :birth_on
      t.string :affiliation, limit: 128
      t.references :user_status, foreign_key: true
      t.references :user_role, foreign_key: true
      t.references :prefecture, foreign_key: true

      t.timestamps
    end
    add_index "user".pluralize, :disclose_id, unique: true
    add_index "user".pluralize, :email, unique: true

    create_table "referral_hospital".pluralize do |t|
      t.references :user, foreign_key: true
      t.string :hospital_name, limit: 255, null: false
      t.string :referral_status, limit: 1000

      t.timestamps
    end

    create_table "question_type".pluralize do |t|
      t.string :name, limit: 45, null: false

      t.timestamps
    end
    add_index "question_type".pluralize, :name, unique: true

    create_table "question".pluralize do |t|
      t.string :content, limit: 300, null: false
      t.references :question_type, foreign_key: true
      t.boolean :is_deleted, null: false, default: false

      t.timestamps
    end

    create_table "answer_option".pluralize do |t|
      t.references :question, foreign_key: true
      t.string :content, limit: 100, null: false
      t.boolean :is_alert, null: false, default: false
      t.boolean :is_deleted, null: false, default: false

      t.timestamps
    end

    create_table "answer".pluralize do |t|
      t.references :user, foreign_key: true
      t.boolean :is_deleted, null: false, default: false

      t.timestamps
    end

    create_table "answer_contents".pluralize do |t|
      t.references :answer_option, foreign_key: true
      t.references :question, foreign_key: true
      t.references :answer, foreign_key: true
      t.string :content, limit: 511
      t.boolean :is_deleted, null: false, default: false

      t.timestamps
    end

    create_table "answer_comment".pluralize do |t|
      t.string :comment, limit: 511
      t.datetime :answer_confirmed_at, null: false
      t.references :answer_confirmed_user, foreign_key: { to_table: :users}
      t.references :answer, foreign_key: true
      t.boolean :is_deleted, null: false, default: false

      t.timestamps
    end
  end
end
