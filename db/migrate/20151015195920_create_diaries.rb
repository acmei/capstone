class CreateDiaries < ActiveRecord::Migration
  def change
    create_table :diaries do |t|
      t.boolean :filled_in_session
      t.integer :how_often
      t.datetime :end_date
      t.reference :user

      t.timestamps null: false
    end
  end
end
