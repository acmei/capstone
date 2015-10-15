class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :num_val
      t.string :text_val
      t.boolean :bool_val
      t.references :question, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
