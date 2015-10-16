class CreateTherapists < ActiveRecord::Migration
  def change
    create_table :therapists do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :phone, null: false
      t.string :password_digest, null: false

      t.timestamps null: false
    end
  end
end
