class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :module
      t.string :text
      t.string :acronym
      t.boolean :favorite
      t.text :description
      t.references :user, index: true, foreign_key: true
      t.references :diary, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
