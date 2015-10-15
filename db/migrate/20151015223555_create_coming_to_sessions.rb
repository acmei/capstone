class CreateComingToSessions < ActiveRecord::Migration
  def change
    create_table :coming_to_sessions do |t|
      t.string :name
      t.integer :value
      t.references :diary, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
