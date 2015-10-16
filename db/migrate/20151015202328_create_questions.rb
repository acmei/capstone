class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :text, null: false
      t.string :category
      t.string :answer_type, null: false

      t.timestamps null: false
    end
  end
end
