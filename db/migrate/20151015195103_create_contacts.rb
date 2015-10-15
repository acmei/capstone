class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :contact1
      t.string :contact2
      t.reference :user

      t.timestamps null: false
    end
  end
end
