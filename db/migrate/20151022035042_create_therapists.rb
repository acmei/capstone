class CreateTherapists < ActiveRecord::Migration
  def change
    create_table :therapists do |t|
      t.string :username
      t.string :name
      t.string :email
      t.string :phone
      t.string :password_digest
      t.string :remember_digest
      t.string :activaton_digest
      t.boolean :activated
      t.datetime :activated_at
      t.references :photo

      t.timestamps null: false
    end
  end
end
