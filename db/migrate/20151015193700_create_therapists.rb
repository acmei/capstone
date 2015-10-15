class CreateTherapists < ActiveRecord::Migration
  def change
    create_table :therapists do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
