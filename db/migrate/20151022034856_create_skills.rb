class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :text
      t.string :category
      t.string :acronym
      t.text :description

      t.timestamps null: false
    end
  end
end
