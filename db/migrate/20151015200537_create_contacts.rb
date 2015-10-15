class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :contact1
      t.string :contact2
      t.references :therapist, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
