class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :session_day
      t.string :uid
      t.string :provider
      t.string :password_digest
      t.string :remember_digest
      t.string :activation_digest
      t.boolean :activated
      t.datetime :activated_at
      t.references :photo
      t.references :therapist

      t.timestamps null: false
    end
  end
end
