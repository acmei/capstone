class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :text
      t.string :category
      t.string :answer_type
      t.integer :recurrence

      t.timestamps null: false
    end
  end
end
