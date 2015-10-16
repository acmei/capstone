class CreateDiaries < ActiveRecord::Migration
  def change
    create_table :diaries do |t|
      t.boolean :filled_in_session
      t.integer :times_filled
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
