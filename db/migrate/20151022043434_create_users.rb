class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :session_day, default: "Monday"
      t.string :uid
      t.string :provider
      t.string :password_digest
      t.string :remember_digest
      t.string :activation_digest
      t.boolean :activated, default: "false"
      t.datetime :activated_at
      t.references :photo, index: true, foreign_key: true
      t.references :therapist, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
