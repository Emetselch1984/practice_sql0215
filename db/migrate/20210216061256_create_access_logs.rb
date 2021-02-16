# frozen_string_literal: true
class CreateAccessLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :access_logs do |t|
      t.date :request_month,null: false
      t.references :user,null: false, foreign_key: true

      t.timestamps
    end
    add_index :access_logs,:request_month
    add_index :access_logs,%i[user_id request_month]
  end
end
