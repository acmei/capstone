class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :contact1_name
      t.string :contact1_phone
      t.string :contact2_name
      t.string :contact2_phone
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
