class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :category, null: false
      t.string :text, null: false
      t.string :acronym
      t.boolean :favorite, null: false, default: false
      t.text :description, null: false
      t.references :user, index: true, foreign_key: true
      t.references :diary, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
